for f in homeworkflume/*
do
        nc -w 3 localhost 6666 < ${f}
done

