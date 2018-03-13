package com.devone.finalp.iamport.model.vo;

import com.devone.finalp.common.model.vo.Payment;
import com.siot.IamportRestClient.request.AuthData;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Header;
import retrofit2.http.POST;

public interface Iamport_interface {

	@POST("/users/getToken")
	Call<IamportResponse<AccessToken>> token(
			@Body AuthData auth);

	@POST("/payments/cancel")
	Call<IamportResponse<Payment>> cancel_payment(
			@Header("Authorization") String token,
			@Body CancelData cancel_data);
}
