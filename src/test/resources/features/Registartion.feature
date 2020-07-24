# language: ru

@Feature
Функционал: Проверка возможности регистарции на веб-сайте.

  Структура сценария: Успешная регистрация на веб-сайте.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Тогда Открывается окно 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <имя_пользователя>, <почта>, <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Появлятся бар: вы вошли как <имя_пользователя>

    Примеры:
      | имя_браузера      | имя_пользователя | почта                   | пароль        |
      | 'google-chrome'   | 'test546300'  | 'test@test.ru' | 'qawsderfgt1' |
      | 'mozilla-firefox' | 'test546500'  | 'test@test.ru' | 'qawsderfgt1' |

  Структура сценария: Неудалось зарегистрироваться -- данное имя пользователя недоступно.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <имя_пользователя>, <почта>, <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Имя пользователя' полявляется сообщение: 'Данное имя пользователя недоступно.'

    Примеры:
      | имя_браузера      | имя_пользователя | почта                    | пароль        |
      | 'google-chrome'   | 'test546300'  | 'other1@test.ru' | 'qawsderfgt1' |
      | 'mozilla-firefox' | 'test546500'  | 'other2@test.ru' | 'qawsderfgt1' |

  Структура сценария: Неудалось зарегистрироваться -- данный e-mail адрес недоступен.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <имя_пользователя>, <почта>, <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Электронная почта' полявляется сообщение: 'Данный e-mail адрес недоступен.'

    Примеры:
      | имя_браузера      | имя_пользователя     | почта                    | пароль        |
      | 'google-chrome'   | 'TestOther1' | 'other1@test.ru' | 'qawsderfgt1' |
      | 'mozilla-firefox' | 'TestOther2' | 'other2@test.ru' | 'qawsderfgt1' |

  Структура сценария: Неудалось зарегистрироваться -- пароль должен состоять как минимум из 7 символов.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <имя_пользователя>, <почта>, <пароль>
    Тогда Под полем 'Пароль' полявляется сообщение: 'Valid password must be at least 7 characters long.'

    Примеры:
      | имя_браузера      | имя_пользователя     | почта                    | пароль   |
      | 'google-chrome'   | 'TestOther1' | 'other1@test.ru' | 'qawsderfgt1' |
      | 'mozilla-firefox' | 'TestOther2' | 'other2@test.ru'  | 'qawsderfgt1' |

  Структура сценария: Неудалось зарегистрироваться -- Имя пользователя - обязательное поле.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <почта>, <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Имя пользователя' полявляется сообщение: 'Это поле обязательно.'

    Примеры:
      | имя_браузера      | почта                    | пароль        |
      | 'google-chrome'   | 'other1@test.ru' | 'qawsderfgt1' |
      | 'mozilla-firefox' | 'other2@test.ru' | 'qawsderfgt1' |

  Структура сценария: Неудалось зарегистрироваться -- Электронная почта - обязательное поле. Google Chrome.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <имя_пользователя>, <пароль>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Электронная почта' полявляется сообщение: 'Это поле обязательно.'

    Примеры:
      | имя_браузера      | имя_пользователя     | пароль   |
      | 'google-chrome'   | 'TestOther1' | 'abcd$8' |
      | 'mozilla-firefox' | 'TestOther2' | 'abdc$7' |


  Структура сценария: Неудалось зарегистрироваться -- Пароль - обязательное поле.
    Дано Открыт браузер <имя_браузера>
    Дано Открыта веб-страница по адресу: 'https://misago.rnd.lanit.ru:58443/'
    Когда Пользователь жмет на кнопку 'Регистрация'
    Когда Пользователь вводит данные для регистрации: <имя_пользователя>, <почта>
    Когда Пользователь кликает на кнопку 'Зарегистрировать аккаунт'
    Тогда Под полем 'Пароль' полявляется сообщение: 'Это поле обязательно.'

    Примеры:
      | имя_браузера      | имя_пользователя     | почта                    |
      | 'google-chrome'   | 'TestOther1' | 'other1@test.ru' |
      | 'mozilla-firefox' | 'TestOther2' | 'other2s@test.ru'  |