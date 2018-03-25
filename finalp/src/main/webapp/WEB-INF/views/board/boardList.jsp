<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>

	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	table{
		font-size : 1.5em;
	}
	.left-side>a:link { color: red; text-decoration: none;}
 	.left-side>a:visited { color: black; text-decoration: none;}
 	.left-side>a:hover { color: blue; text-decoration: underline;}
 	.pageCenter{
 		position: relative;
 		margin: auto;
 		display: table;
 	}
 	.pageCenter>ol>li>a{
 		font-size: 1.5em;
 	}
 	a{
 		text-decoration: none !important;
 	}
 	.left-side{
 		border: 1px solid #999;
 		border-radius: 5px;
 		padding:5px 10px;
 	}
 	.left-side a{
 		color: #444;
 		font-size: 1.7em;
 	}
 	.active{
 		background: pink;
 	}
	
</style>
<meta charset="UTF-8">
<title>board</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />

	<div class="container" style="margin-top: 5%">
		<div class="col-lg-2">
			<c:if test="${pagectr.c_id ==null}">
			<div class="left-side active">
			</c:if>
			<c:if test="${pagectr.c_id !=null}">
			<div class="left-side">
			</c:if>
				<a href="blist.do?page=1">
					전체 게시판
				</a>
			</div>
			<c:if test="${pagectr.c_id == 'pro'}">
			<div class="left-side active" style="margin: 5px 0;">
			</c:if>
			<c:if test="${pagectr.c_id != 'pro'}">
			<div class="left-side " style="margin: 5px 0;">
			</c:if>
				<a href="blist.do?c_id=pro&page=1">
					물품 나눔 게시판
				</a>
			</div>
			<c:if test="${pagectr.c_id == 'stu'}">
			<div class="left-side active">
			</c:if>
			<c:if test="${pagectr.c_id != 'stu'}">
			<div class="left-side">
			</c:if>
				<a href="blist.do?c_id=stu&page=1">
					지식 나눔  게시판
				</a>
			</div>
		</div>
		<div class="col-lg-10">
			<div class="row">
				<div class="col-lg-12">
					<div class="col-lg-4" ><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIPEhISEBIVFRUVFxUQFRUVFRUQFxUVFRcWFhUXFhUYHSggGBolHhUVITEiJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGi0lHyUtLS0tLS0tLS0tLS0vLS0tLS8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOUA3AMBEQACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAQIDBAUGBwj/xABJEAABAwIEAwUDBwcJCQEAAAABAAIDBBEFEiExBkFREyJhcYEykbEUI1JiocHRBzNCU3JzsxYkdIKSorTT4TRDRVVjk7LS8BX/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIEAwUG/8QAOBEAAgECBAIGCAUFAQEAAAAAAAECAxEEEiExBUEyUXGhsdETFCIzUmGBwRU0keHwI0JygvGyJP/aAAwDAQACEQMRAD8A9wQCoAQAgBACAEAIAQCONtSobsrsDIZmvF2kEeCrCpGavF3Jaa3JFcgbI8NBJNgNSqykoq7JSuYLOJW9rlI7mwd49bdF5MeLQdbK+j1/zkaHh3lvzN9jgRcbFewZhUBFPUNjsXuAuQNTbUmwVJ1IwtmdiUm9iVXIBACAEAIAQAgBACAEAlkAqARAKgBACAEAIAQAgMbiStyMyNOrt/ALyeKYn0cPRx3Z3oQu7s5qlqXxG7HEfA+a8GjiKlF3gzXKCktTpMOx9r9JO6evI/gvew3FIT0qaPuMk6DWxk43ipmOVmjB9q87H451nlj0fE70qWXV7mPlXmHc2sCxYxEMfqw7fV/0Xr8Ox/o7U6nR5Pq/bwM1alfVbmhiXETW3bF3j15D8VrxPFYx9mnq+spDDt6yOZq53SkmQ3v7vcvCq1p1HmmzVGKirI6XhbEjI0xyG72czu5vI+f4L6jAYn09K73Wj8/qYasMsjfW05AgBACAEAIAQAUAgQCoAQAgEQCoAQAgKWLzFkZINidAseOqunRbW50pRvIw4cWlbub+eq8SnxGvDnftNLoxZfhx4fptt5fgt1Pi8f74nJ4d8mYdbKZXlx5/BeLiKrq1HNmmEcqsV8i4FxCxANLUAhapAmVAIWoBpagJKOUxyMeDax18WncLXg8S8PUzcuZSpDPGxvz8TfQZ6lelU4x8Ef1OCw3WzIxDGJ5GuGfLcEd3S2iwVOIV6mjdl8jtGjFHRcL4v8rha8izvZcPrDQ/bdfUU554KS5mCSs7GwrkAgBABQCBAKgBACAEAIBEAqAEBjY8++VvqvF4rPowNFBbsxyxeK0aRCxVA0sVSRpYoJGliAaWoBC1ANLUA0tUgYQoJGkIAsgIag6WUolF7gKoyTTw8iRI3ydv9t19RwypmoJdWhhxEbTO8XoHAEAIBAgFQAgBACAEAIAQGHLUvubOO68OrXq5mlI0xjGwz5VJ9Iri8TW+Itkj1EUpLjdxus9Scpu8ncsklsRli4NFhpYqNEjC1VaJGlqqyRpaoA0tQDS1SSNLUAwtQDHNQDC1CRtkBUlNz9ilEhBO6M5maO2vYX9670q06fQdiJRUtyc43UfrXLt67X+JlPRQ6htPxLNFUQdo9zmOL2uB2uR3SV6HDq9SpUed3sjhXhGMdEeixOuAeuq9oyj0AIAQAgBACAEAFAYUjdSvAqr232mqOwmRcmrkhkXJosIY1zaJGli5tEjHMXNokjLFWxJGWqANLUJGlqAaWqQMLUBGWoSMLUBFKbBCSmQpLDHBSiBmW6slchmTjB+epANu1P8A47letwt/1HbqM2I6J7JS+w3yC90yEqAEAIAQAgBAQvqWjmuMq8I8yyi2QvrugWeWM+FF1TKZFzdefJ5m2dUKGKliR4YqtXFx3ZLi0MwhhXOSJzET4lxaLJld8aoyxC5qgkjIUAbZSBCFIGEISRlqgEbggKlRv5IWRAQpJEyXUpXDIpPsVrkFWWnY5zHPBOQ5m2NrFaMPiJUZZolJwU1ZnY0XF0YAbIwi2lxqvVp8Vg+krGd4d8jZpcZglLQ2Rt3GwB0JNibDqbAn0W6liaVTSLOMqco7o0FoKAgBACAEBj5dT5n4ryqsMs2jvF3Q4NXOxYgxKujpYnTTOysbqTYncgAADUkkgADUkgKrTbslqSZUWPVL9Y8Mqy3kXGmiuOuV0ocPUBdfUqz6u/yKekiTtxir/wCV1P8A3KT/ADlHqNbrj3+RHpESsxmptd2G1I8n0rj6ATKssBWtfTv8iuZFygxeOZ2Sz45ALmKVjon2FrkB3tgXGrbjXdZKlGdPSat4FkxMZxOOlYHyXOZwjYxjTI+R7tmMYNXHQnwAJNgCVw9DOcskFdls1jIOKVbtRhdTbld9I0+7ttFo/CMQ+ce/yJVaKInV9Z/yyp/7lL/nJ+D4j4o9/kW9PHqZH8vqhq/DapreZBp32HXK2Uk+gVZcIxCV04v6vyJVeHzNCJ4eA5uoIuOWh8DsvOs02nujqZ2I4s2J4hjY+edwzCGIAuyk2zPJIbG3fVxF7G11ow+Fq4h+wtOt7FZTjDcfFQ4o8XMFLH0a6eR5t4lsYAPvXpLg2mtTu/c4+sfIa+mxFly+kjeP+hUBzvRsjGj+8qT4PUXQmn2q3mWWIXNEcFc15c2zmPbq6ORpjePGx3Hi0keK8ytQqUHaoreH6naLUuiZceISTF/yWkqKhrXFjpIxEyPM02cGuke3NY6EjS43WqjwyvVipaJPrv8AZESrwi7EjW1pNjhtSPEupvulXb8Hr/FHv8ivrMOpjXCtP/DKq37dL/nKXwivylHv8h6zDqZG6KtP/DKr+3S/5yfhFf4o9/kPWafUyJ7ahn5+jqIWnQPf2T2XOwJje4t8yLeK5VuH16UXJ2aW9r/dItCtCTsNKxHQy5657K2kbF7Tcz/LOOzB/smQeq9nhNPWU/oZsS9ke1018rb72F17RkJUAIAQAgM+Zlnu9D79PuWTER1TOkGAas1joY3EUYdJQtdqDVMJHI5Y5ntv5Oa0+gU0F/WXYysuidSvTOI0vANrrjUr04O0nZkpNigg7LpCcZq8XdEWIKukbKAHDUHMx3NrhsQeR+IJB3UVIKcXGWzJTsZU8WatpMw9mOoePB3zLbjxs5w9SvL4erVZX5K3eXnsbq9c5iEoBrpANyFDaSuxY5DG60U8U8zW5soc5jds7ie42/LM4geq+Rq2xGJeR6SlZPuv9z0F7MNeSNbhTAhRxd8555PnKiUjWSQjXyaNgNgAAvrKdONOKhFaIwNtu7NOasYw2c4ArlVxVGlLLOaTLRpykrpD4qhr/ZcD6rrCpCorwaa+WpVxa3MniaKNzWOIGdru6eYvoR5WXn8XlH1Zp7u1u3/howt/SXI+Cg2KjgiNg6NuRw+sCbn139Vsw9WFWmpQ28DjUi4yaZuteDzXcoOQDXPA3KAo4zUxthkzkWLSLdbjbxXDEVYU6blIvTi5SSR5m8r5KCtFI9KWrKPBtKanE5HkaRkNF+jR+Nz6r6fh8MtBfPU8+u7zPagFtOQqAEAICGSoA21XKdVLYsokBcXbrNKTludErCgKLAx8fHztB/Sm/wAGdKS/qrsZEuidIt5yKk1QxjyHOaDYHUgdeq87ESiq2vV92XWxnYXiDZ6qbsXB8cccbHvaczO1LnnKCNC5rbX/AGwuuEXSaWjIkbZWuTSV2VMiYfzyn/dVH/lAvPwi/qSb5q/eXlsbC9EocrjmPUlPM9lRUwxv0OWSRjDYgWNnHZfMcRw054mUlBtaa2b5GyjO0FqU6LHKOodlgqIJHfRZIx59wN158qDhrKDXarHbNfZkfEkWeEdGzUsh/ZjqYZHf3WkrVgJKOJg31vvTS7znUV4M7lfWmE5bHHSwSOe6J74Xa54wZHM01D4x3iPFt99tLrxMdw+pOo6tPW+68jTSrJLKyrSV8UwLoZGutocrtWnoRu0+BXjtSpS5xl+jNC9pdaCVxcbuJPmb2SU51Hecm+3kWVlokV5Fzkk+RZNor0shFZQgEjNM9ptzHYTGx9QD6L0uDxSxErfD90ccU26a7fsz0NfSmA4fix3z58gvmOLRTxOvwrxZ6OGbVP6+Rz8jlgjGK2R2bZA4q5Us4bib6d4ey1xpqL6dPJaaGKqUX7L+hSdNT3O6wfieKezXHI/oTofIr3MPj6dXR6Mxzoyibq3HEEBXrwezdl3tceYUSV1YJmfRziRocOe46HmFias7Ha5aaoBI0KSDG4h/O0H9Kb/BnU0/ersYfROjW05FKvwmnqCDPBFKW6AyRtkI8sw0QFmngZG0Mja1jRs1oDQPIBAVcSmljyvYzOwX7RovnA5OYP0ra3boelzoc1elKdmnty6/5+hZMpSyB1ZSlpuHQ1BBGxBNOQuOGknVbXUS9jaW8oMkgY7VzWnzAPxQFPEcKglYQ6JmmoOUAtcNQ5pGoIPNVlFSTT2ZKdnoYpYHtLXC4IsR1B0K+Jjto+w9F7mnh1flaGSE6aB29wNr+K+jwvE6c0lVeWXc/ry+pknQa1jqjTZIHbEFeommro4bGXi3DdLVHNJEA8bSxkxSjykZYqs4RmssldfMlNrVGBU0EtI4Me4yRu/NyGwfcDVkltCbXIcLXsQddT8/xHAqis9Po811fM2UaufR7leRy8s0FalP88oP3z/8POvT4P8AmH/i/FHDE+7Xb9mejr6QwnCcXH58+QXzPFfzP+q8Wehhvd/XyOeeVgR3IXFWIGXUgx+IsQMbWxsvnkNtNCGfpG426eq24DD+lqXeyONapljpueycIzyPpozILGwAA0sALAL6U882kAIDCdCYZ7AdyW7h9V4Fz7wPsXCrHmXizQauBckCkgxuIvztB/Sm/wAGdIe9XYyH0ToltOZWtd7r8gPvWOrFSq69XmdE7RKs9WY6iCIHSUS6dCwNcCPDUg+YVqN4zcL6WuVequaa1FTnZBlr6do2EdUR6mB3xJWGkrYqa+SZ0fRTOiW45mdNO/M4B1gDbYdAvJxOIrRqyUJWStyXUaIQjlTaKdRO8gguNvQLza+LxEk4uenySR1jCCd0jGxLF46Ysa/O58hLY442Olkfa2azGjYXFybAXFzqFloUKlaWWmr2Lyko6sbBj8DnBkhdC8mwZOx1O5x3s3OAH/1SV1q4WtS6cdOtaru2+pCnGWzNQd3UG3loudKpKnrTlbw/TZktX0krlnBMY7aWWB2r4mRy36tkMjRfxvG70IX0mAxMsRSzSWqdu3bzMlamoSsizj8YdA+/Kzh5g3V8ck8PUv1PwFH3i7TjJHr5FHokNEb1lB++f/h516nB/wAxL/F+KOGJ92u37M9KX0hgOB4xP84PkF8zxX8z/qvFnoYb3f18jnXuWBHchcVYgjc+1z01UpAz+B8JdiVWZng5QdAeTR7I/HxJX1WFoKjTUTzak80rnvEMQY0NGwFloOY9AITZG7ApTT5jpsslSpfRHRRsI0qhYlaVJBjcQ/naD+lN/gzpD3q7GQ+idGtpzMXGKOtc8OpJ4IwRZwmhfNcjYgtlZb7VxnQU5ZrsspWViPCMDlZN8pq5xNMGGJmRnYxxNcQX5GXcbuLW3JJ9kKadKMNtyG7m45wG66kHPza19M6xsY6nWx/6NvgsdHWvOXZ3HWXRSOgzhbDkYmJcPtneZBU1Md7XbHJlb0uAQVwnhaU5ZpR1LKckrJlM8JfQrqsO5Fz2SD1a5liFylw/Dv8As8Syqz6yDBactrs8ti4U5hBA0DmyXkt0zDLp9XwWPhkFSq1qV9U1+nL9zrX9qMZHT1dPFM0slY17ToWuaHg+YIXsGY5+Xgmk/wB06eADTLBPLEweUd8o9As9TC0anSgn9C6qSWzNLAcDgoQ8Q5iXnPJJI50r3kCwzPdqbDQDkusIRhHLFWXyKttu7I+JKsCPILku6A7c15/FKuWi4LeWn05+R3w0byzPkcdJm+ifcV856OXUbboZhp/ntD++f/h516XCFbES/wAX4o44r3a7fsz05fSGA8+41P8AOD5BfM8V/M/6rxZ6OG939fI5t7lhR3InOUkDLqQdDwdjTKWQtkADXnV4/RPU+C9TA470f9OptyfV+3h2GatRze1Hc9MY4EAg3B1BXvGEVAYuL4mI5WRPIAeO6b7u+ienh6+uevmt8i8LDmOWW50JWuVrkErXKbgirKYSht92ubI09HN2PxHkSjumpLdDTZlhtQ/m0ehXX1l84lfRrrHfKHfR+1PWX8LHo/mHbu+j9qesP4WMi6xLuJ100OyZ5z30FktiGaAuLHNJzM2PdtqNR5H7gqpyTvEjTmS9q+2reY5j7l0ddpdEZV1jRMe73f0evkjxFv7WSofMBOTpax5G9/eqrE35Bw+ZnVbA3Z3e9pxF7+JavKxbVN54S9p6neGujWhA3GizY3G3IFcqfGaselFPuf3XgWeGi9tCYcQjJmLTvbSxW5cXhkzuD7vNHP1Z3tcqVHEt7BjTuBdxGl9Nh+K4S4y5NKnD9fJeZdYVLVsyMUxB+c97kOQ8V5+Irzz3b1O0IKxUp6xzngF1wb8h0KrSqSlKzLSikiqKns5hIN45DI3wILgfeHOHqlOtKhW9JH/qJcFOGVnU/wAto7axuv5i3vXrfjMLdB3+n87jN6m+s5HF8SNRI6R2l9h0HILx61aVao6kv+I1wgoRyoznOVESRlysQNugEfIGgkmwGpJ0sFKTbsgdP+TLiszOfATeMW7K4ObnmN+TTpYfjZfTYKlUp0kpv9vkebWlGUro9MWs5GXj2DMq4y1415HmDyIQHN4TWywyfJam5dr2cn02jkfrALFWpZdVsdYyvob7XrhmLkrXqcxFh4epzCw8PTOLC50ziwudR6QWGmWx9PEqY1UQ4jMw5hc3WJyjc4HJc3WZbKUMUxeOmj7SV2VrQATYnUloaAALuJOgAuSSolVc2oR1bCja7ZRdiNY9t4KGUh2uaR8UJt+ySSF3lhK7jaMkn9SqqRvqFLNW/wC8oXA8j20bvgucOH1be3JN/Ul1Y8kZFdR1z3EtoHeYniAPjY6rI+DVb6SXedo4qCWzIpxURRAVFPJES7Q3bKy5OgLmHQnxUV8BUo0G207b2LQrRnO2xQbU6i/UfFebDpJmhrQs1MsTzcyEaW0H+i0zjTm7tnNZlyK0czGSCzrt11PkVWCjGej0LNNoqVE13OI2LnEeVyuc9ZNotFaERkVCwwvVkQROerEDC5SBC+26kGATLiMgihB7O/8Aa8T4dAvewWCVNZ57+B59atm0Wx7VwRwkyhjBIu87lekZzrEAIDJxZzMw0GYX15gHoseKq2WVHWnHmVGvWHMdbEgemYiw8SKMwsOEiZhYXtFGYmwdoq5xYQyKjmTYjdKubqEpEMk64SqllEyquMS1NCHatE5kI5Etgmy366kHzAWrhTzYh3+F+KKV1aH1O2X0RkBACAo43l7CUO2yn/RccRJKlJvazL003NW6zyefQlfHR2R7Fys6RXsBhkSwG9olgIXqbAQvUkDC9SQNzKSBcyA7D8l8MDXSNygSXzDxaenkfuX0WAxHpadnujzsRTyyutmelrccAQFevq2wxukeQGtFyTsPEnkFScssWyUrs5l1V2hzXvfUHcWXhzqOUm2akrIe2RVzE2HtkUZhYeJEzEWHiRQ5E2DtVVzFhDKqOZNhjpVycybET5VylMskQmS65XuWsV2OvV0P71/8CZenwd//AESS2yvxRxxHQ+p3C+kMZnYzM5oZlNrmx9xWDiNWdOknB2d0d6EVKTuuRlS1Lxs8rx3i8Rym+7yNChD4TIxCpkeLOeSOl1lq16tTScm/58jpGMVsjBq4s3n8fEeKpv2nROxkytsiOlyu4qxI3MlgJmU2IGl6mxA0uUkBmQC3QE1HivyORk+a2Q63NswO7fG/xstOEqShVTir+RyrRUotM9ww2sbPGyRmzgHdNxzB2X0x5ZaQEVTFna5t7XFkB5diWA1uHOc+mPaRElxiOo8cv0fRZq2FhU12ZeM2i5gePNqswyuY9ls7HDa+1jzGi8evQnRftGiMlLY2GyLPmL2HCRRmFh3aqrkTYQyqjkLDTKqORawx0q5uRNiPPdV3JGl91VvkgNg/2ui/ev8A4Ey9Xg35iX+P3RxxHQ+p3a+lMRQxnCY6uPs5HSNFw4OikfA8EdHsIPoqTpwmrTSa+epKk47MwJOCS0fMV9UwjlK5tW0+B7VpdbycCss+H4eX9tuzTw0OirTXMyaynqKchlW1pzHKyaK4jeeTXNcSY3HkCSD1vYLx8Zw+VFZ4u8e9eZqpVlPR6MoVDV5xoM6ojzbb/HxHir79pKdjNlaiLkDlZAjJUgaSrWIG5lNgKChBmVmLWJZE3M7Yk+yD8XHy963YfASqe1LRGeriFHRbmlw9wXVVzw+TNbqdLfsjYL2qVCFJWijDOpKb1Pc+HsL+SQtjvey6lDTQAgEc0HQhAcnjlNFDIezaA54BcRzte3xXj8TqaqJooR5mcJF5FzRYd2iq2TYXtVVsWEMqo2TYaZVVsmw3PdQlckQvUN8kBzSoA/Plcx49pjs7fA2LT9jiPVacPWnQmpx/6isoqaszcj4i6s9xXsrjEecH3fsZ3hvmTsx5p3a4e5dY8WpPdNfTyZV4aXWjQo61k18h1G45i+1wt9GtCrHNB3RxlBxdmOrKVszHRvF2uFiP/ua6NJqzKnnNZCWEtdu0lpPUg2uvj61P0dSUOp93LuPVjLMlLrM2Zq5linOzNtv06+I8Vda9pKdihI1SixWcFZAjKsBEAIDoPyc4RBPUy9q0EizwPA/6gr3+HzzUbdR5uJjad+s9jggbGLNAA8FuM5KgBACAEBwWM1gkmeQQQDlBBvsvl8ZVz1WzdSjaJTEiyNnQd2ircmwnaKrZIdoqtgQOuiVyRTIocuSFhWuUAkDraqyIKNXiJa9kbIpJpZLlkUQaXZW2zOJcQ1rRcak7lasNhaldtQ5bt7FZzjBaivxQw/7VT1FP4yxZmeskRe1o/aIWipw/EU/7b9j+zsyqrU3zt2lilxulkF2VMDh9WWN1vOx0WdxlHSUWvoy1r7M0OC6wVNXPJCc8LImxGRpux8peXZWuGjso3I079twV7fC6U4QlKStd6Iy4iSbSXI7deoZzz/HB89J+0V8pjfzNTtX/AJR6VL3cf5zMaYLNY6IoyhSiStK3NtvzHXxHium4vYovaiLEDgrAahIIDU4QrxBXQ3IHaXjtfUn2hp5By9ThknmcTHi1ome5tNwvZMIqAEAIAQHmXFnAUsszp6V3ZuOp7P5u56nLa581znShPpJMlSa2OXmp8VpPaHatH0m3P9ptvvWGpwujLbQ6xryW50Mchs3MLEgEjoSAbL5ypHLJx6jandXHdouZYVrrolcAZOmyhvkgKHKCSVpUkDHyX05K6RJrcC04+VVcpHe7OnjafqAyuNv6zne5fRcIt6F/5PwRixXTXYduV6pmM+owOlkN5KaFx6uiY4+8hAXIIWxgNY0NaNg0BoHoEAlTMGNLnGwAuqzmoRcpbIlJt2R57Wy53Od1JPvXyM5OcnN83c9JK1l1GbMq2LFOUISVZApJIpGZtt+Y6+I8fBX3BUcxQSZuKVD4w0RgFzjYXubaX2G62YSgq02mzlWqOCugpOHq+q+nY9Pmx9mv2r2IYKjDlftMUsRN8zruGfyZTRyMleQ0gg+PvWpJLY5Nt7nsMLMrQOgspIHoAQAgBACAY+MO3AKA8vxF1pZB0cQvjcR72Xaz04dFEDTf71xSuWFMnIbf/alG+SJFDlUEjXIQJLLbQK0YhDWOXSwLlDWOicHMNjt6dD4LrRrVKMs1N+TKyjGStI6Ol4p/WM9W/gV61Pi/xwf018bGd4b4WXm8SQn6Q9FoXFKHz/Q5+rz+QyXiSMey1x+xVlxSkuim+4lYd82YeJ4q+bQ6N+iPv6rzcRialfSWi6vPrO8IRhsZMpWVouVJVBJVeEJIHtUEkD2qSSN7M3nzHXxHj4K25OxRDAaimB+mfgvS4X7x9hmxXRR73RQtaxtgBoOS9wwllACAEAIAQAgBACA8U4ixgwVErJYJG95xzXjcMt9D3XnfkN18/U4XWnNyutWbI14pWMl3GEewhlt/U95726q+E1tron1mJs4bWieNsjQQDfR1r6Gx2XnV6MqM3CW53jNSV0XAVxJFklyjx5K0VcEDXLpYkmaVNipK1ymxBK1yskQTNcrJEDw5WIGuKAieqskrvCqSV3tUFiB4QkxsWxhlO4MLXOcRms22g2F7kdCtWHwlSsm4nOdVQ0ZnniRv6qX+5/7LR+GVutFPWYE+HYgKmop8rHNLX5jmy94EWuLHfqFtweEnRm5Stscq1VTVkfQlN7DfIL0TMSoAQAgBACAEAIAKAx8Q4bp6h2aRgJQFT+RVH+qCA53ibBmUjmCJtmOBNvEb/d7l4HGKdpxn1q36f9NmGlo0YrnWFyvHSuaStmJNyuqRJI1SQStUkErUIJWqxBK1WIJApIFKAjcFAIXhVZZEDwqkkDwhJncH4W2vr5S8XY05B5N0+N19JgaeSivnqYK0rzZ6j/Iqj/VBbDkS0/CNJG4ObGARqEBuNFtEA5ACAEAIAQAgBAIEAqAEBznHUN6cvDS4xnNZouSNjYev2LFj8O69LLHe6t/Ow60ZqMrs8Wq+JZHutFAdNO+b2/qt/FYaXCWunL9DvLErkh1NR4lUkFuYDezWhg/H7Vthw+hFbXOLrzZ0sWYaPGVw0cDyK8KtSdKbgzZGSkromauRYlapIJWqSGStViCQFSQKgGOUA5ni3FXx5IIDaV+pI3a38SfgVuwOGVWWaS0RyqzyqyKwGJwtDns7Ru/ebY+9tvgttThtKXR0Oca8luRP4myg9pA9jrG1rOF7adCscuGVE9HdHVYiJ2/5G8OLYXSu3dz8ea9yKskkY27npakAgBAIgFQAgBACAEAgQCoAQAgI6iEPaWu2OhQGPScKUsRuIxffUIDXipmM0a0D0QHE8b4VkcJ2DQ91/wBxXm8Rw+eGdbrw/Y70J2dmcDinEkUF2s+dk2ytPdafrO+4XK83D4KpV12R3nVjEz6HB67FHguuG3uALtY3yHM+Juvbo4SnSWiMsqkpHUxslpXCCq9rZj+TvA+K8vGYP0bzw28DvTq30Zec8NBc4gAC5J0AA3JKwJX0OpxWJYhLicogpgeyv5GQ9T0b0C9zB4PJ7U9/Ay1Kl9EbrsMr8Na3MDNFbVp3b+y77irV8DCprHRkQqtbliPiCB0b5M2XIC5zHaPFuVufTReTPDVIyUWjQpxauUvye4O/EKp1VMNL5rcgOTR5Be/RpKlBRRklLM7ntRp22sWi22y6lTLr+Gaab2o2+5AXcLw1lMwMjFggLiAEAIAQCIBUAIAQCBAKgBACAEAIAQAgK9fStmY5jhcOBHvQHB4X+TGGOUvfbLfutAsAEB3lHRRwtDY2gAdEBR4gwSOsjLHjXkeYKhq+jB4/xLgtc6RlKdY77gG79dM552WWlg6dObkvp8jpKo2rHpHBHCEdFGC4AvO5Ws5nVyxNcLOAIQHFcTfk7gqu8wBrt0sDoOGMEbRQiNu/MoDYQAgBACAEAIAQAgEQCoBEAqAEAIAQAgBACAEAIAQAgBARuhaTcgX6oCRACAEAIAQAgIxM3YOG9t+emnnqPegEjqWO0a9p1I0cDq3ceYQDmStJsCL9L66abIBJ5mxtLnGzRqTqbDqbckBEa+PXvjQhp8CSRr4Xa4X2u09EAgxCI2GdupyjXc6Aenebrscw6hAOZWMdls72i5rdCLltw4a8+67TwKAsIAQAgBACAEAIAQAgBACAEAIAQAgBACAEAIAQAgMgYAwhwe9xzAtNsrO6XOdYWFx7R1vm1ve9rAPbgrQWESyAsLnN9gDM5rmkloZY+07yugFw/COye57n5iXOfYNDGgvDQ7q79E87a9RdAWKnD2yRuiJdlduSe0PoZM1vuQEP/wCQ25IkeLuDyO4QQHSPyG7fZzSF3XQa20QDBgcYc12Z92uDxq2wtazRp3WgC2ltHEbGyAmgw0NLD2j3ZXSPAdksXSEuJNmjUZnAW5E73QF5Af/Z"></div>
					<div class="col-lg-4" >
					<table class="table table-bordered table-hover">
						
						<tr style="background : #E9909A ">
							<th>
							</th>
							<th >
								조회수
							</th>
						</tr>
						<c:forEach var="view" items="${bestViewList }" varStatus="index">
						<tr>
							<td>
							${index.count}
							</td>
							<td>
								<c:if test="${loginUser !=null }">
								<c:url var ="bdetail" value="bdetail.do">
									<c:param name="board_id" value="${view.board_id}"/>
								</c:url>
								<a href="${bdetail}" class="pointer noticeClick">${view.title}</a>
								</c:if>
								<c:if test="${loginUser ==null }">
									${view.title}
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
					</div>
					<div class="col-lg-4" >
					<table class="table  table-bordered table-hover">
						
						<tr style="background : #36E3EC ">
							<th>
							</th>
							<th>
								추천수
							</th>
						</tr>
						<c:forEach var="Rec" items="${bestRecList }" varStatus="index">
						<tr>
							<td>
							${index.count}
							</td>
							<td>
								<c:if test="${loginUser !=null }">
								<c:url var ="bdetail" value="bdetail.do">
									<c:param name="board_id" value="${Rec.board_id}"/>
								</c:url>
								<a href="${bdetail}" class="pointer noticeClick">${Rec.title}</a>
								</c:if>
								<c:if test="${loginUser ==null }">
									${Rec.title}
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
					</div>
				</div>
			</div>
			
			<div style="margin-top: 10px;">
				<table id="dt_basic" class="table table-striped table-bordered table-hover" width="80%" style="background: white;">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${blist}">
							<tr>
								<c:url var ="bdetail" value="bdetail.do">
									<c:param name="board_id" value="${board.board_id}"/>
								</c:url>
								<td>
								<c:if test="${loginUser !=null}">
								<a href="${bdetail}" class="pointer noticeClick">${board.title}	</a>
								</c:if>
								<c:if test="${loginUser ==null}">
								${board.title}
								</c:if>
								</td>
								<td>${board.member_name}</td>
								<td>${board.creation_date}</td>
								<td>${board.readcount}</td>
								<td>${board.recommend_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<hr />
				
				<div>
					<c:url var="writeform" value="writeForm.do">
						<c:param name="member_id" value="${loginUser.member_id}"/>
						<c:param name=""/>
					</c:url>
					<c:if test="${loginUser != null}">
					<a href="${writeform}" class="btn pull-right" style="background: #efefef; border: 1px solid #999; font-size : 1.5em">글쓰기</a>
					</c:if>
				</div>
				<div class="pageCenter" style="clear: both;">
					<ol class="text-center pagination" >
						<c:if test="${pagectr.currentpage > 1}">
						<li><a href="blist.do?page=${pagectr.currentpage-1}&c_id=${pagectr.c_id}">[이전]</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage <= 1}">
						<li><a href="#" onclik="return false">[이전]</a></li>
						</c:if>
						<c:forEach var ="i" begin="${pagectr.startpage }" end="${pagectr.endpage}">
						<c:if test="${pagectr.currentpage == i}">
						<li ><a href="blist.do?page=${i}&c_id=${pagectr.c_id}" style="background : pink">${i}</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage != i}">
						<li><a href="blist.do?page=${i}&c_id=${pagectr.c_id}">${i}</a></li>
						</c:if>
						</c:forEach>
						<c:if test="${pagectr.currentpage < pagectr.maxpage}">
						<li><a href="blist.do?page=${pagectr.currentpage+1 }&c_id=${pagectr.c_id}">[다음]</a></li>
						</c:if>
						<c:if test="${pagectr.currentpage >= pagectr.maxpage}">
						<li><a href="#" onclick="return false">[다음]</a></li>
						</c:if>
					</ol>
				</div>
			</div>
		</div>
	
	</div>
	<a href="wcList.do">채팅방 리스트 보기</a>
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
	채팅방 만들기
	</button>
	
	 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      <form action="chat.do" method = "post" target="채팅방">
      	<input type = "hidden" name="member_id" value="${loginUser.member_id }" readonly>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">채팅방 만들기</h4>
        </div>
        <div class="modal-body">
        	 <table class ="table table-striped table-bordered" >
                  	<tr>
                   		<th>채팅방 이름</th> 
                   		<td><input type = "text" name="room_name"></td>
                   	</tr>
              </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="submit" onclick="chat(this.form)"class="btn btn-default">만들기</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
	
	<script>
	var chat=function(form){
		var url = "chat.do";
		var title="채팅방";
		var status="width=500,height=600, left=1500, resizable=0";
		window.open('',title,status);
		form.target = title;
		form.action=url;
		form.method = 'post';
		form.submit();
	}
	</script>
</body>
</html>