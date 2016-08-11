import QtQuick 2.4


/////////////////////////////////////////////////////////////////////////////
// IMPORTANT !!!
// Use «» symbols for quotes in any strings in model, do not use " symbols
// as they are should be used ONLY to enclose string (be first and last in
// string declaration). The only exception is the setting font color and size
// via embedded simplified HTML - in this case one should use \" instead of
// just ", see examples in code below
//
// JUST COPY «» from here and insert in strings below where needed
/////////////////////////////////////////////////////////////////////////////

// While it could be considered suboptimal to have explicit coordinates for
// each particular item, it allows to make any number of movies per page
// and have any layout specific for particulat page
//
// centerX - X of movie thumbnail center on the screen
// centerY - Y of movie thumbnail center on the screen
ListModel {
    ListElement {   // Page 1
        movies: [
            ListElement {
                centerX: 780
                centerY: 225
                thumbnail: "../../resources/videoarchive/archive/thumb1.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>60-летие освобождения Беларуси <br>от немецко-фашистских захватчиков</b></font><br>2004 год"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
           ListElement {
                centerX: 1500
                centerY: 260
                thumbnail: "../../resources/videoarchive/archive/thumb2.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>60-летие освобождения Беларуси</b></font><br><br>от немецко-фашистских захватчиков</b></font><br>2004 год"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
             ListElement {
                centerX: 570
                centerY: 720
                thumbnail: "../../resources/videoarchive/archive/thumb3.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Белорусская операция «Бобруйский котел»"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
           ListElement {
                centerX: 1240
                centerY: 760
                thumbnail: "../../resources/videoarchive/archive/thumb4.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>Исторические хроники 1941 г</b></font><br>Константин Симонов. Начало войны"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            }
        ]
    }

    ListElement {   // Page 2
        movies: [
            ListElement {
                centerX: 780
                centerY: 225
                thumbnail: "../../resources/videoarchive/archive/thumb1.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>КРАСНАЯ ЗВЕЗДА</b></font><br>1943 Сентябрь. Недетский дневник"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 1500
                centerY: 260
                thumbnail: "../../resources/videoarchive/archive/thumb2.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>КРАСНАЯ ЗВЕЗДА</b></font><br>Леонид Мороз"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 570
                centerY: 720
                thumbnail: "../../resources/videoarchive/archive/thumb3.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>КРАСНАЯ ЗВЕЗДА</b></font><br>Выпуск 12"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 1240
                centerY: 760
                thumbnail: "../../resources/videoarchive/archive/thumb4.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>КРАСНАЯ ЗВЕЗДА</b></font><br>Владимир Марченко. Тихон Скачков"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            }
        ]
    }

    ListElement {   // Page 3
        movies: [
            ListElement {
                centerX: 780
                centerY: 225
                thumbnail: "../../resources/videoarchive/archive/thumb1.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>Немецкая хроника</b></font><br>Могилев и Смоленск в оккупации"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 1500
                centerY: 260
                thumbnail: "../../resources/videoarchive/archive/thumb2.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Операция Багратион"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 570
                centerY: 720
                thumbnail: "../../resources/videoarchive/archive/thumb3.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Ленино. Славянский прорыв"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 1240
                centerY: 760
                thumbnail: "../../resources/videoarchive/archive/thumb4.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Минская операция"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            }
        ]
    }

    ListElement {   // Page 4
        movies: [
            ListElement {
                centerX: 1500
                centerY: 260
                thumbnail: "../../resources/videoarchive/archive/thumb1.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Партизаны"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 570
                centerY: 720
                thumbnail: "../../resources/videoarchive/archive/thumb2.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Подрывники"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 1240
                centerY: 760
                thumbnail: "../../resources/videoarchive/archive/thumb3.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Путь солдата"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 780
                centerY: 225
                thumbnail: "../../resources/videoarchive/archive/thumb4.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Сталинград"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            }
        ]
    }

    ListElement {   // Page 5
        movies: [
            ListElement {
                centerX: 1500
                centerY: 260
                thumbnail: "../../resources/videoarchive/archive/thumb1.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Тыл"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
            ListElement {
                centerX: 780
                centerY: 225
                thumbnail: "../../resources/videoarchive/archive/thumb2.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ОНИ СРАЖАЛИСЬ ЗА РОДИНУ</b></font><br>Подполье"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            },
             ListElement {
                centerX: 570
                centerY: 720
                thumbnail: "../../resources/videoarchive/archive/thumb3.jpg"
                title: "<font color=\"#E2D19F\" size=\"4\"><b>ПРЕЗЕНТАЦИЯ</b></font>"
                movie: "../../resources/videoarchive/archive/video-sample1.mp4"
            }
        ]
    }


}
