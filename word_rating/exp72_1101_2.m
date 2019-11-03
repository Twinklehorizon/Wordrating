%ÿ��trial��������mark��һ���ǵ��ʳ��ֵ�ʱ��  markֵΪ���ĵ����У�
%�ڶ���mark����ȷѡ����ֵ�ʱ�� markֵΪ�������е�ֵ+1��  ��˵����е�mark��ֵ���Ҫ����2

clear;
addpath([pwd,'\materials']);
addpath([pwd,'\record']);

textsize=40; %�����С
peroption=2;  %ÿ��ѡ����ֵ�ʱ��
info1='1����������Ҳûӡ��';
info2='2�����������е�ӡ��';
info3='3����������ǳ���Ϥ';
info4='4������������������';
info5='5����������Ҳ������������ʶ��';

know1='1��ʶ';
know2='2����ʶ';

blank=1.5; %���������ʱ��
%%
[num, txt, raw]=xlsread('ɸ���¾ɻ�2019��11��3��.xlsx');

% address = hex2dec('D100'); %���ڵ�ַ
% config_io;
% global cogent;
% if( cogent.io.status ~= 0 )
%     error('inp/outp installation failed');
% end
% outp(address,0);

% trialnum=length(raw);
trialnum=177;
rng('Shuffle');
condition=randperm(trialnum);


knowKeys=[KbName('1'),KbName('2')];%��ʶ������ʶ����
validKeys=[KbName('1'),KbName('2')];%��ѡһ���尴��
%%
sub=inputdlg({'���Ա��'});
subID=sub{1};

if exist( [ [ pwd,'/record/'],['subID-',subID,'.mat'] ] ,'file')
    error('The data file exists! Please enter a different subject ID.');
end

Screen('CloseAll');
Screen('Preference', 'SkipSyncTests', 0 ,[100 100 800 800]);
Screen('Preference','SuppressAllWarnings', 1);
ListenChar(2);
HideCursor;
% [w,wrect]=Screen('OpenWindow',0,0,[100 100 800 800]);
 [w,wrect]=Screen('OpenWindow',0,0);
hz=FrameRate(w);
hz=round(hz);
[xc,yc]=WindowCenter(w);
AssertOpenGL;
Screen('BlendFunction', w, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Priority(MaxPriority(w));
Screen('TextFont',w,'-:lang=zh-cn');
%%

while 1
    drawcenteredtext(w,'���ո����ʼ��������',wrect,255,30);
    Screen('Flip',w);
    [~,~,kc]=KbCheck;
    if kc(32)
        break;
    end
end
KbReleaseWait();


for trial=1:trialnum
    thistrial=condition(:,trial);
    thisword=raw{thistrial,1};
    thismark=raw{thistrial,3};
    thisoptions=raw(thistrial,2:3);
    
    theans=thisoptions{1};
    thisoptions=Shuffle(thisoptions);

    if strcmp(thisoptions{1},theans)==1
        correctKey=validKeys(1);
    else
        correctKey=validKeys(2);
    end
    
        
    judge=0;
    marked=0;
    subres=0;
    RT=[];
    ART=[];
    subchosen=[];
% 
%     
%     drawfix(w,40,xc,yc);
    Screen('Flip',w);
    WaitSecs(0.05);
    
    drawcenteredtext(w,thisword,wrect-[0 50 0 100],[255 0 0],textsize);

    

    
    drawcenteredtext(w,know1,wrect+[-100 50 -200 100],255,30);
%     drawcenteredtext(w,know2,wrect,255);
    drawcenteredtext(w,know2,wrect+[100 50 200 100],255,30);

    
   startime=Screen('Flip',w);
   allstart=startime;
   
        while 1
            
                [~,secs,KeyCode]=KbCheck;

                if sum(KeyCode(knowKeys))
                    endtime=secs;
                    Screen('Flip',w);
                     WaitSecs(0.2);
                    break;
                   

                elseif kc(27)
                    ListenChar(0);
                    ShowCursor;
                    sca;
                    save( [ [pwd,'/record/'] , ['subID-',subID,'.mat']] ,'result');
                    return;
                end
%                 if GetSecs-startime>=3
%                     Screen('Flip',w);
%                     endtime=inf;     
%                     break;
%                 end
            end
    
       RT_know=endtime-startime;
%        judge_know=sum(KeyCode(correctKey));
       subchosen_know=find(KeyCode==1)-96;
       ART_know=endtime-allstart;
    
        

%     for flip=peroption*hz
%         if flip==1
%             thisoption=thisoptions{1};
%             resstart=GetSecs;
%             
%         elseif flip==peroption*hz+1
%             thisoption=thisoptions{2};
%             resstart=GetSecs;
%             
%         elseif flip==peroption*hz*2+1
%             thisoption=thisoptions{3};
%             resstart=GetSecs;
%             
%         elseif  flip==peroption*hz*3+1
%             thisoption=thisoptions{4};
            resstart=GetSecs;
%         end
%    drawfix(w,40,xc,yc);
%     Screen('Flip',w);
%     WaitSecs(1);
%         thisoption_left=thisoption{1};
%         thisoption_right=thisoption{2};
%         drawtwotext(w,thisoptions{1},wrect,'left',255,textsize);
%         drawtwotext(w,thisoptions{2},wrect,'right',255,textsize);
%         drawcenteredtext(w,thisoptions{1},wrect-[200 0 200 0],255);
%           drawcenteredtext(w,theans,wrect,255,40);
%         drawcenteredtext(w,thisoptions{2},wrect+[200 0 200 0],255);
        
%         startime=Screen('Flip',w);
        
%         while 1
%         [~,~,kc]=KbCheck;
%             if kc(10) ||  kc(74) 
%                 subres2=find(kc)-96;
%                 break;
%             end
%         end

%         while 1
%             
%             [~,secs,KeyCode]=KbCheck;
% 
%             if sum(KeyCode(validKeys))
%                 endtime=secs;
%                 Screen('Flip',w);
%                 WaitSecs(blank);
%                 break;
%             
%             elseif KeyCode(27)
%                 ListenChar(0);
%                 ShowCursor;
%                 sca;
%                 save( [ [pwd,'/record/'] , ['subID-',subID,'.mat']] ,'result');
%                 return;
%             end
%             if GetSecs-startime>=1
%                 Screen('Flip',w);
%                 endtime=inf;     
%                 break;
%             end
%         end
%         
%        RT=endtime-startime;
%        judge=sum(KeyCode(correctKey));
%        subchosen=find(KeyCode==1);
%        ART=endtime-allstart;
        
        
        
        
%         if marked==0
% %             if thisoption==theans
%               if strcmp(thisoption,theans)==1
% %                 outp(address,thismark+1);
%                 WaitSecs(0.004);
% %                 outp(address,0);
%                 marked=1;
%             end
%         end
%         if subres==0
%             [~,~,kc]=KbCheck;
%             if kc(32)
%                 RT=GetSecs-resstart;
%                 ART=GetSecs-allstart;
%                 subchosen=thisoption;
% %                 if subchosen==theans
%                     if strcmp(subchosen,theans)==1
%                     judge=1;
%                 else
%                     judge=2;
%                 end
%                 
%                 subres=1;
% 
%         end
%     end

    drawcenteredtext(w,theans,wrect-[0 200 0 300],255,40);
    
    drawcenteredtext(w,info1,wrect-[0 100 0 200],255,20)
    drawcenteredtext(w,info2,wrect-[0 50 0 100],255,20)
    drawcenteredtext(w,info3,wrect,255,20)
    drawcenteredtext(w,info4,wrect+[0 50 0 100],255,20)
    drawcenteredtext(w,info5,wrect+[0 100 0 200],255,20)
    
    Screen('Flip',w);
    while 1
        [~,~,kc]=KbCheck;
        if kc(97) ||  kc(98) || kc(99)|| kc(100)|| kc(101)
            subres2=find(kc)-96;
            break;
        elseif KeyCode(27)
             ListenChar(0);
             ShowCursor;
             sca;
             save( [ [pwd,'/record/'] , ['subID-',subID,'.mat']] ,'result');
             return;
        end            

    end
    
    
    Screen('Flip',w);
    WaitSecs(0.2);
    KbReleaseWait();
    
    result(trial).trial=trial;
    result(trial).thisword=thisword;
    result(trial).type=thismark;
    
    result(trial).theans=theans;
    
    result(trial).subchosen_know=subchosen_know;
%     result(trial).judge=judge_know;
    result(trial).RT_know=RT_know;
    result(trial).ART_know=ART_know;
    
    result(trial).thisoptions=thisoptions;
%     result(trial).subres=subchosen;
%     result(trial).subchosen=subchosen;
%     result(trial).judge=judge;
%     result(trial).RT=RT;
%     result(trial).ART=ART;
    result(trial).subres2=subres2;
    
    
  
end
save( [ [pwd,'/record/'] , ['subID-',subID,'.mat']] ,'result');
sca;
ListenChar(0);
ShowCursor;












