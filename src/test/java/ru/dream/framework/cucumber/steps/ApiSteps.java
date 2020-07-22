package ru.dream.framework.cucumber.steps;


import io.cucumber.java.ParameterType;
import io.cucumber.java.ru.Дано;
import io.cucumber.java.ru.Затем;
import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.filter.log.LogDetail;
import io.restassured.filter.log.ResponseLoggingFilter;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.testng.Assert;
import ru.dream.framework.cucumber.types.Methods;

import java.io.IOException;

import static io.restassured.RestAssured.given;

/**
 * Шаги для тестов API.
 */
public class ApiSteps {
    private static final String URL;

    private Response response;

    static {
        try {
            System.getProperties().load(ClassLoader.getSystemResourceAsStream("settings.properties"));
        } catch (IOException e) {
            //Logger
        }
        URL = System.getProperty("url") + System.getProperty("api.prefix");

        RestAssured.requestSpecification = new RequestSpecBuilder()
                .setBaseUri(URL)
                .setAccept(ContentType.JSON)
                .setContentType(ContentType.JSON)
                .log(LogDetail.ALL)
                .build();

        RestAssured.filters(new ResponseLoggingFilter());
    }

    @ParameterType("(.*)")
    public Methods method(String name) {
        return Methods.valueOf(name);
    }

    /**
     * Отправка запроса.
     * @param endpoint - эндпоинт для реквеста.
     * @param method - Http метод.
     */
    @Дано("отправка запроса по эндпоиту {string} с использованием метода {method}")
    public void validateResponse(String endpoint, Methods method) {
        switch (method) {
            case POST : response = given()
                    .when()
                    .post(endpoint);
                    break;
            case PUT : response = given()
                    .when()
                    .put(endpoint);
                    break;
            case PATCH : response = given()
                    .when()
                    .patch(endpoint);
                    break;
            case DELETE : response = given()
                    .when()
                    .delete(endpoint);
                    break;
            case GET :  response = given()
                    .when()
                    .get(endpoint);
                    break;
        }

    }

    /**
     * Проверка ответа.
     * @param code - ожидаемый статус код.
     * @param message - ожидаемое сообщение.
     */
    @Затем("ожидаем статус код {int} и сообщение {string}")
    public void checkResponse(int code, String message) {
        if(message.equals("null")) {
            response.then()
                    .statusCode(code);
        }
        else {
            String result = response.then()
                    .statusCode(code)
                    .extract()
                    .jsonPath()
                    .getString("detail");
            System.out.println(result);
            Assert.assertEquals(result, message);
        }
    }
}
