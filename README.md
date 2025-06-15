# SI-GEFAL: Simulación Integral de un Almacén Autónomo 🤖🏭🚀

Bienvenido a **SI-GEFAL** (Sistema de Gestión Física de Almacén Autónomo), un proyecto ambicioso que materializa la visión de un almacén 100% automatizado. Este repositorio no contiene solo una base de datos, sino un ecosistema completo de software que simula las operaciones, la gestión y la inteligencia detrás de un moderno centro logístico.

## Visión del Proyecto

Desde siempre, la idea de un almacén que opera de forma autónoma ha sido una fascinación. Un sistema donde robots inteligentes reciben, organizan, almacenan y despachan mercancía sin intervención humana directa. Este proyecto es el primer gran paso para hacer esa visión una realidad, explorando las tecnologías necesarias y demostrando las inmensas ventajas de la automatización.

### ¿Por Qué Automatizar un Almacén?

La automatización de almacenes no es solo una tendencia, es una revolución logística que ofrece beneficios transformadores:
*   **✅ Eficiencia Máxima:** Operaciones 24/7 sin fatiga ni pausas, procesando pedidos a una velocidad inalcanzable para un sistema manual.
*   **🎯 Precisión Absoluta:** Elimina prácticamente el 100% de los errores humanos en la recolección, ubicación y conteo de inventario.
*   **📦 Optimización del Espacio:** Los sistemas automatizados pueden operar en pasillos más estrechos y a mayores alturas, aumentando la densidad de almacenamiento hasta en un 80%.
*   **🛡️ Seguridad Mejorada:** Reduce drásticamente los accidentes laborales al minimizar la interacción de los empleados con maquinaria pesada.
*   **💰 Reducción de Costos:** Disminuye los costos operativos asociados a mano de obra, errores, devoluciones y daños a la mercancía.
*   **📊 Control Total del Inventario:** Visibilidad en tiempo real de cada artículo, su ubicación exacta y su historial de movimientos.

---

## 🏛️ Arquitectura del Ecosistema

SI-GEFAL está compuesto por tres componentes principales que trabajan en conjunto, todos orquestados alrededor de una base de datos central.

1.  **El Simulador (C# Console Application):** Es el corazón visual del proyecto. Una aplicación de consola con una estética retro que simula el entorno físico del almacén, el movimiento de los bots y la distribución de las estanterías.
2.  **El Sistema de Gestión (Django Web App & API REST):** Es el cerebro administrativo. Permite gestionar la "compra" de artículos, visualizar el inventario y, a través de su API REST, interactuar con otros sistemas.
3.  **La Base de Datos (MySQL):** Es la memoria central. Almacena de forma persistente toda la información sobre productos, inventario, ubicaciones, bots y movimientos, asegurando la integridad de los datos entre el simulador y el sistema de gestión.

---

## 📸 Galería de Pantallas

Un recorrido visual por los componentes clave de SI-GEFAL.

### 1. El Simulador de Almacén (C#)

| Menú Principal | Configuración de Parámetros | Visualización del Almacén |
| :---: | :---: | :---: |
| *Interfaz de inicio con estética retro.* | *Definición de las dimensiones y bots del almacén.* | *Representación gráfica de las estanterías y los bots.* |
| ![Menú del Simulador](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SimuladorCSharpAlmacen/SimuladorAlmacen.png) | ![Entrada de Datos del Simulador](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SimuladorCSharpAlmacen/EntradasSimulador.png) | ![Imagen del Almacén](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SimuladorCSharpAlmacen/ImagenEntradaSimulador.png) |

### 2. El Sistema de Gestión (Django)

| Página Principal | Menús de Navegación | Gestión de Artículos |
| :---: | :---: | :---: |
| *Bienvenida al sistema de gestión web.* | *Acceso a las diferentes secciones de la aplicación.* | *Lista paginada de artículos con opciones de CRUD.* |
| ![Página Principal](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SoftwareAmacen/PantallaIncialWareHouse.jpg) | ![Menús](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SoftwareAmacen/PantallaIncialWareHouseMenu02.jpg) | ![Lista de Artículos](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SoftwareAmacen/ListaArticulosComprasSimple_01.jpg) |

| Creación de Artículo | API REST (Listado) | API REST (Creación) |
| :---: | :---: | :---: |
| *Formulario para agregar nuevos productos al sistema.* | *Endpoint GET para listar productos vía API.* | *Endpoint POST para crear productos vía API.* |
| ![Crear Artículo](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SoftwareAmacen/CreaciondeArticulo.jpg) | ![API List](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SoftwareAmacen/ListaArticuloAPIsRest.jpg) | ![API Create](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/SoftwareAmacen/ListaArticuloAPIsRest_01.jpg) |


### 3. La Base de Datos (MySQL)

| Diseño del Esquema | Tablas Principales |
| :---: | :---: |
| *Vista del esquema en MySQL Workbench.* | *Estructura de las tablas clave del sistema.* |
| ![Diseño DB](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/MySQLAlmacen/imagenBaseDatosSQL-01.png) | ![Tablas DB](https://raw.githubusercontent.com/rafaelsotove73/DB_SqlAlmAut/main/MySQLAlmacen/Captura%20de%20pantalla%202025-06-15%20092218.png) |

---

## 🛠️ Stack Tecnológico

*   **Simulador:**
    *   Lenguaje: **C#**
    *   Plataforma: **.NET Console Application**
*   **Backend & API:**
    *   Framework: **Django**
    *   Framework API: **Django REST Framework**
    *   Lenguaje: **Python**
*   **Frontend:**
    *   Maquetación: **HTML5**
    *   Estilos: **Bootstrap / CSS3**
*   **Base de Datos:**
    *   **MySQL**

---

## 📂 Estructura del Repositorio

*   `/MySQLAlmacen`: Contiene los scripts `.sql` para la creación del esquema y las tablas de la base de datos, además de imágenes de referencia.
*   `/SimuladorCSharpAlmacen`: Código fuente de la aplicación de consola en C# que simula las operaciones físicas.
*   `/SoftwareAmacen`: Código fuente del proyecto Django que conforma la aplicación web de gestión y la API REST.

---

## 🚀 Puesta en Marcha

1.  **Base de Datos:** Ejecuta los scripts en la carpeta `/MySQLAlmacen` en tu servidor MySQL para crear la base de datos y sus tablas.
2.  **Backend (Django):** Navega a la carpeta `/SoftwareAmacen`, instala las dependencias (`pip install -r requirements.txt`) y ejecuta el servidor. Asegúrate de configurar la conexión a la base de datos en `settings.py`.
3.  **Simulador (C#):** Abre el proyecto en `/SimuladorCSharpAlmacen` con Visual Studio, configura la cadena de conexión a la base de datos y ejecútalo.

---

## 👨‍💻 Desarrolladores

*   **Rafael Soto**
*   **Dulimar Pire**
