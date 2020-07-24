# language: ru

@Feature
Функционал: Проверка возможности регистарции на веб-сайте.

  Структура сценария: Успешная регистрация на веб-сайте.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Имя пользователя' значение <имя_пользователя>
    Когда Пользователь вводит в поле 'Электронная почта' значение <почта>
    Когда Пользователь вводит в поле 'Пароль' значение <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Окно 'Регистрация закрывается'
    Тогда Появлятся бар: вы вошли как <имя_пользователя>

    Примеры:
      | имя_браузера      | имя_пользователя | почта                   | пароль        |
      | 'google-chrome'   | 'Test190720_g1'  | 'test190720_g1@test.ru' | 'Test$190720' |
      | 'mozilla-firefox' | 'Test190720_f1'  | 'test190720_f1@test.ru' | 'Test$190720' |

  Структура сценария: Неудалось зарегистрироваться -- данное имя пользователя недоступно.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Имя пользователя' значение <имя_пользователя>
    Когда Пользователь вводит в поле 'Электронная почта' значение <почта>
    Когда Пользователь вводит в поле 'Пароль' значение <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Имя пользователя' полявляется сообщение: 'Данное имя пользователя недоступно.'

    Примеры:
      | имя_браузера      | имя_пользователя | почта                    | пароль        |
      | 'google-chrome'   | 'Test190720_g1'  | 'other190720_g1@test.ru' | 'Test$190720' |
      | 'mozilla-firefox' | 'Test190720_f1'  | 'other190720_f1@test.ru' | 'Test$190720' |

  Структура сценария: Неудалось зарегистрироваться -- данный e-mail адрес недоступен.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Имя пользователя' значение <имя_пользователя>
    Когда Пользователь вводит в поле 'Электронная почта' значение <почта>
    Когда Пользователь вводит в поле 'Пароль' значение <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Электронная почта' полявляется сообщение: 'Данный e-mail адрес недоступен.'

    Примеры:
      | имя_браузера      | имя_пользователя     | почта                    | пароль        |
      | 'google-chrome'   | 'TestOther190720_g1' | 'other190720_g1@test.ru' | 'Test$190720' |
      | 'mozilla-firefox' | 'TestOther190720_f1' | 'other190720_f1@test.ru' | 'Test$190720' |

  Структура сценария: Неудалось зарегистрироваться -- пароль должен состоять как минимум из 7 символов.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Имя пользователя' значение <имя_пользователя>
    Когда Пользователь вводит в поле 'Электронная почта' значение <почта>
    Когда Пользователь вводит в поле 'Пароль' значение <пароль>
    Тогда Под полем 'Пароль' полявляется сообщение: 'Valid password must be at least 7 characters long.'

    Примеры:
      | имя_браузера      | имя_пользователя     | почта                    | пароль   |
      | 'google-chrome'   | 'TestOther190720_g1' | 'other190720_g1@test.ru' | 'Test$1' |
      | 'mozilla-firefox' | 'TestOther190720_f1' | 'other90720_f1@test.ru'  | 'Test$1' |

  Структура сценария: Неудалось зарегистрироваться -- Имя пользователя - обязательное поле.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Электронная почта' значение <почта>
    Когда Пользователь вводит в поле 'Пароль' значение <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Имя пользователя' полявляется сообщение: 'Это поле обязательно.'

    Примеры:
      | имя_браузера      | почта                    | пароль        |
      | 'google-chrome'   | 'other190720_g1@test.ru' | 'Test$190720' |
      | 'mozilla-firefox' | 'other190720_f1@test.ru' | 'Test$190720' |

  Структура сценария: Неудалось зарегистрироваться -- Электронная почта - обязательное поле. Google Chrome.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Имя пользователя' значение <имя_пользователя>
    Когда Пользователь вводит в поле 'Пароль' значение <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Электронная почта' полявляется сообщение: 'Это поле обязательно.'

    Примеры:
      | имя_браузера      | имя_пользователя     | пароль   |
      | 'google-chrome'   | 'TestOther190720_g1' | 'Test$1' |
      | 'mozilla-firefox' | 'TestOther190720_f1' | 'Test$1' |


  Структура сценария: Неудалось зарегистрироваться -- Пароль - обязательное поле.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит в поле 'Имя пользователя' значение <имя_пользователя>
    Когда Пользователь вводит в поле 'Электронная почта' значение <почта>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Пароль' полявляется сообщение: 'Это поле обязательно.'

    Примеры:
      | имя_браузера      | имя_пользователя     | почта                    |
      | 'google-chrome'   | 'TestOther190720_g1' | 'other190720_g1@test.ru' |
      | 'mozilla-firefox' | 'TestOther190720_f1' | 'other90720_f1@test.ru'  |





