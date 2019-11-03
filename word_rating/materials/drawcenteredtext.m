function drawcenteredtext(wptr,str,rect,color,textsize)
%������������ĳ�����������ھ��л��ƺ���
%��һ������ָ�����ڴ���
%�ڶ�������ָ�����Ƶ��ı�
%����������ָ�����е�����

if nargin<3
    error('���ˣ�����̫����');
elseif nargin<4
    color=0;
    textsize=24;
elseif nargin<5
    textsize=24;
end

str=double(str);
oldsize=Screen('TextSize',wptr,textsize);
drect=Screen('TextBounds',wptr,str);
sx=(rect(3)-rect(1)-drect(3))/2+rect(1);
sy=(rect(4)-rect(2)-drect(4))/2+rect(2);
Screen('DrawText',wptr,str,sx,sy,color);
Screen('TextSize',wptr,oldsize);