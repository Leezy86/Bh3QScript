[General]
SyntaxVersion=2
BeginHotkey=90
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=88
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=505b5d64-3b1a-456e-a860-043c439ed9c8
Description=����ϣvs��Ϻ37632(��up31360)
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
/*
�Զ�ʶ��ս����ʼ������ս��ǰ��������Ϻ���������������ͳ���
����ͻ�������Ч120֡����
1p �¹� ���� ����ţ
2p ��� ԭ�� �Ź�ţ
3p �˰� ��ҵ��
��ż���̴�
*/


Sub �����������ϣ��(a, b, c)
/*
a: ����������ӳٶ��ٿ�ʼ���� 
b: ����֮���ӳٶ�ò�ʮ�ּ� 
c: ����ʮ�ּ�֮���ӳٶ������
*/
	KeyDown "w", 1
	KeyPress "1", 1 // �������
	// ���ʮ�ּ�
	Delay (a)
	KeyPress "k", 1
	KeyUp "w", 1
	Delay(b)
	KeyPress "u", 1
	Delay(c)
	KeyPress "1", 1 // ��ϣ����
	Delay(700) // qte��ʱ
End Sub

Sub ϣ���չ�(time)
	KeyPress "j", 1
	Delay(time)
End Sub

Function ϣ���չ�1()
	Call ϣ���չ�(500)
End Function

Function �����������ϣ��1()
	Call �����������ϣ��(700,220,200)
End Function

Function �����������ϣ��2() // �ڶ����������͵�һ����һ���������ʱ��
	Call �����������ϣ��(900,220,740)
End Function


Function �����������ϣ��()
	KeyPress "1", 1 // �����������
	Delay (700)
	KeyPress "1", 1
	KeyPress "k", 1 // �������
	Delay (700)
End Function

Function ��ϣ������()
	KeyDown "j", 1
	Delay (1000)
	KeyUp "j", 1
	Delay(100)
End Function

Function ��ϣ������()
	KeyDown "w", 1
	KeyDown "j", 1
	Delay (1000)
	KeyUp "j", 1
	KeyUp "w", 1
	Delay(600)
End Function


Function Main()

	//�¹⿪ʼ����
	
	Delay(400)
	KeyDown "w", 1
	KeyPress "k", 1
	Delay (600)
	KeyUp "w", 1
	
	Delay (1400)
	KeyPress "u", 1 // ��������
	Delay(400)
	
	�����������ϣ��1
	Delay(200)
	// ϣ����ʼ���
	��ϣ������ 
	
	KeyPress "i", 1 // �����Ӵ������
	Delay (1500)
	
	// ���к�ĵ�һ������
	��ϣ������ 
	// ����������
	KeyDown "a", 1
	KeyPress "k", 1
	KeyUp "a", 1
	��ϣ������ 
	Delay(100)
	// A3��
	ϣ���չ�1 
	ϣ���չ�1 
//	ϣ���չ�1 // 2s����
//	ϣ���չ�1 // 2s����
	Delay (200)
	
	
	// ���¹���������
	KeyPress "1", 1
	KeyDown "s", 1
	KeyDown "d", 1
	
	Delay (100)
	KeyPress "k", 1  // ���ܵ�����״̬�Ա�
	KeyUp "s", 1
	KeyUp "d", 1
	// ��ʼ�ܣ���ʱ�䣬��16���ʱ���ٴ�����
	
	// ��һ�´�
	Delay(1000)
	KeyDown "w", 1
	Delay (1000)
	KeyUp "d", 1
	KeyUp "w", 1
	Delay (2500)

	Delay(900)
	// ��������
	KeyPress "k", 1
	Delay (6000)
	
	// �������ӹ���
	KeyPress "k", 1
	Delay (1000)
	
	// �����ƶ�
	KeyPress "l", 1 // ��ż
	KeyPress "j", 1
	Delay (300)
	KeyPress "u", 1
	Delay (400)
	�����������ϣ��2
	
	��ϣ������ 
	Delay(300)
	KeyDown "a", 1
	KeyPress "k", 1
	KeyUp "a", 1
	��ϣ������ 
	Delay(300)
	ϣ���չ�1 
	ϣ���չ�1 
	ϣ���չ�1

	KeyPress "i",1

End Function



bh3 = Plugin.Window.Find(0,"����3")
//TracePrint bh3
//sRect = Plugin.Window.GetWindowRect(bh3)
//TracePrint sRect
sRect = Plugin.Window.GetClientRect(bh3)
TracePrint sRect
dim MyArray   
MyArray = Split(sRect, "|")
screenX = Clng(MyArray(0))
screenY = Clng(MyArray(1))
screenX2 = Clng(MyArray(2))
screenY2 = Clng(MyArray(3))


// ��������
dx = -1 
dy = -1

// Ѫ��λ��
healthX = -1
healthY = - 1 

// ʱ�䷶Χ����
timeX = - 1 
timeY = -1
timeX2 = - 1 
timeY2 = - 1 

// ��һ�����¿�ʼ��ť����
restartBtn1X = - 1 
restartBtn1Y = - 1 

// �ڶ������¿�ʼ��ť����
restartBtn2X = - 1 
restartBtn2Y = - 1 

// �жϴ��ڷֱ���
is1080p = False
is720p = False

If (screenX2 - screenX) >= 1920 Then 
    is1080p = True
    //����λ������
    dx = screenX + 562
    dy = screenY + 105
	
    //Ѫ��λ������
    healthX = screenX + 576 + 20
    healthY = screenY + 80
	
    // ʱ�䷶Χ����
    timeX = screenX + 880
    timeY = screenY + 148
    timeX2 = screenX + 1000
    timeY2 = screenY + 200
    
    // ��ʼͼ��λ��
    startx = screenX + 68
    starty = screenY + 160

Else
    is720p = True

    //����λ������
    dx = screenX + 377
    dy = screenY + 86
    //Ѫ��λ������
    healthX = screenX + 382 + 20
    healthY = screenY + 68
    // ʱ�䷶Χ����
    timeX = screenX + 583
    timeY = screenY + 115
    timeX2 = screenX + 673
    timeY2 = screenY + 145
    
    // ��ʼͼ��λ��
    startx = screenX + 46
    starty = screenY + 110
    
End If
TracePrint "��ʼͼ��" + CStr(startx) + "|" + CStr(starty)

TracePrint "ʱ������:" + Cstr(timeX) + "|" + cstr(timeY) + "|" + cstr(timeX2) + "|" + cstr(timeY2)


Global startTime
Global mainThread
Global brokenD



While 1

    IfColor startx, starty, "FF6000", 2 Then
        TracePrint ("start")
        Main 
        ExitScript
        //Delay(5000)
    End If
Wend
