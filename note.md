1. buat apps di main.dart dengan nama 'SynTop' dengan return materialApp 
2. lalu buat folder di dalam 'lib'
   - folder 'pages'
   - folder 'themes'
   - folder 'widgets'
3. di dalam folder 'pages' buat
   - 'splash_screen.dart', dengan return scaffold
4. di dalam folder 'themes' buat 
   - theme.dart, dengan membuat variable
   - background color
   - text color
   - dan bisa diakses dengan memanggil nama variable tersebut
5. edit file 'pubspec.yaml'
   - tambahkan assets gambar
   - tambahkan depedensi paket 'google fonts'
6. di file 'splash_screen.dart' buat widget
   - background color
   - body: column, untuk vertical
   - di dalam column:
   - main axis alignment center, untuk center column
   - children:
    -> Center
        - image asset dan width
    -> Text dan style text, mengambil dari 'theme.dart'
7. di dalam folder 'pages' buat
   - 'landing_page.dart', dengan return Scaffold 
   - body: Padding 
    -> child: List View dengan children 2 row
    -> row 1 dengan main axis alignment spaceAround
        - buat 2 column 
            -> mediaQuery size width
            -> height
            -> color
    -> sebelum membuat row 2, buat jarak vertical dengan SizedBox
    -> row 2 dibungkus dengan scrollview secara horizontal
    -> row 2 dengan main axis alignment spaceAround
        - buat 4 column 
            -> width, height, color
            -> beri jarak horizontal dengan SizedBoox
8. 