# Servir localmente

Para poder editar el código de este repositorio y visualizar los resultados de tus ediciones, es útil poder servir las 
páginas en un servidor local, donde puedas consultar cómo quedan antes de enviarlas. Para esto necesitas:

1. **Clonar este repositorio** y, recursivamente, sus submódulos. Puedes hacerlo con:

   ```
   git clone --recursive https://github.com/dgiim/sites.git
   ```
  
  Otra opción es hacer un *fork* de este repositorio en tu cuenta de GitHub y clonar ese repositorio. Podrás subir tus cambios
  allí y luego solicitar que los introduzcamos al repositorio central mediante un *pull request*.

2. **Instalar Ruby**, y una vez instalado, instalar la gema *bundler*, usando:

  ```
  gem install bundler
  ```

3. **Ejecutar el script `build.sh`**, desde el repositorio que acabas de clonar.
4. **Abrir `0.0.0.0:8000`** con tu navegador. Nuestras páginas se sirven localmente en el puerto 8000. Deberías poder acceder 
   aquí a las ṕáginas estáticas de @dgiim.

Las páginas se actualizarán automáticamente con tus cambios en su código, por lo que no necesitas repetir este proceso para
visualizar los cambios que realices. Cuando hayas terminado, puedes enviar un pull request al repositorio para que aceptemos 
tus cambios.
