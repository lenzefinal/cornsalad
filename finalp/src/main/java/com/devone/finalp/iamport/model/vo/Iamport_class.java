package com.devone.finalp.iamport.model.vo;

import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.siot.IamportRestClient.Iamport;
import com.siot.IamportRestClient.request.AgainPaymentData;
import com.siot.IamportRestClient.request.AuthData;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.request.OnetimePaymentData;
import com.siot.IamportRestClient.request.ScheduleData;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.request.UnscheduleData;
import com.siot.IamportRestClient.request.escrow.EscrowLogisData;
import com.siot.IamportRestClient.request.escrow.EscrowLogisInvoiceData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.PagedDataList;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentBalance;
import com.siot.IamportRestClient.response.PaymentBalanceEntry;
import com.siot.IamportRestClient.response.Schedule;
import com.siot.IamportRestClient.response.escrow.EscrowLogisInvoice;
import com.siot.IamportRestClient.serializer.BalanceEntrySerializer;
import com.siot.IamportRestClient.serializer.EscrowInvoiceEntrySerializer;
import com.siot.IamportRestClient.serializer.ScheduleEntrySerializer;

import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.HttpException;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

@Service
public class Iamport_class {
	
	public static final String API_URL = "https://api.iamport.kr";
	protected String api_key = null;
	protected String api_secret = null;
	protected Iamport iamport = null;
	
	public Iamport_class() {
		this.iamport = this.create();
	}
	
	public Iamport_class(String api_key, String api_secret) {
		this.api_key = api_key;
		this.api_secret = api_secret;
		this.iamport = this.create();
	}
	
	public IamportResponse<AccessToken> getAuth(String api_key, String api_secret) {
		Call<IamportResponse<AccessToken>> call = this.iamport.token( new AuthData(api_key, api_secret) );
		try {
			Response<IamportResponse<AccessToken>> response = call.execute();
			
			if ( !response.isSuccessful() )	throw new HttpException(response); //200이 아닌 경우에는 throw RuntimeException 

			return response.body();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	

	public void cancelPaymentByImpUid(CancelData cancel_data,String api_key, String api_secret) {
		AccessToken auth = getAuth(api_key,api_secret).getResponse();
		if ( auth != null ) {
			Call<IamportResponse<Payment>> call = this.iamport.cancel_payment(auth.getToken(), cancel_data);
			
			try {
				Response<IamportResponse<Payment>> response = call.execute();
				if ( response.isSuccessful() ) {
					
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

	
	protected Iamport create() {
		OkHttpClient client = new OkHttpClient.Builder()
				.readTimeout(30, TimeUnit.SECONDS)
				.connectTimeout(10, TimeUnit.SECONDS)
				.build();
		
		Retrofit retrofit = new Retrofit.Builder()
								.baseUrl(API_URL)
								.addConverterFactory(buildGsonConverter())
								.client(client)
								.build();
		
		return retrofit.create(Iamport.class);
	}
	
	protected GsonConverterFactory buildGsonConverter() {
        GsonBuilder gsonBuilder = new GsonBuilder();

        // Adding custom deserializers
        Object escrowInvoiceStrategy = new EscrowInvoiceEntrySerializer();
        
        gsonBuilder.registerTypeAdapter(ScheduleEntry.class, new ScheduleEntrySerializer());
        gsonBuilder.registerTypeAdapter(Schedule.class, new ScheduleEntrySerializer());
        gsonBuilder.registerTypeAdapter(PaymentBalanceEntry.class, new BalanceEntrySerializer());
        gsonBuilder.registerTypeAdapter(EscrowLogisInvoiceData.class, escrowInvoiceStrategy);
        gsonBuilder.registerTypeAdapter(EscrowLogisInvoice.class, escrowInvoiceStrategy);
        
        Gson myGson = gsonBuilder.create();

        return GsonConverterFactory.create(myGson);
    }
}
