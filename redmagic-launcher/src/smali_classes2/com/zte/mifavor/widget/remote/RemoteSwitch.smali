.class public Lcom/zte/mifavor/widget/remote/RemoteSwitch;
.super Landroid/widget/Switch;
.source "RemoteSwitch.java"


# static fields
.field private static h:Ljava/lang/String; = "RemoteSwitch"


# instance fields
.field private g:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/Switch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/Switch;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    const-class p1, Landroid/widget/Switch;

    .line 5
    .line 6
    const-string p2, "mSwitchWidth"

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {p2}, Lb4/g;->h(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    sget-object v0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->h:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "on Measure: isOutScreen="

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    if-eqz p2, :cond_0

    .line 45
    .line 46
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 47
    .line 48
    const/16 v0, 0x32

    .line 49
    .line 50
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/Switch;->getMeasuredWidthAndState()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 62
    .line 63
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-ne p1, p2, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 70
    .line 71
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 76
    .line 77
    const/16 v0, 0x1e

    .line 78
    .line 79
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    invoke-virtual {p0, p1, p2}, Landroid/widget/Switch;->setMeasuredDimension(II)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_0
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 88
    .line 89
    const/16 v0, 0x28

    .line 90
    .line 91
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/Switch;->getMeasuredWidthAndState()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 103
    .line 104
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-ne p1, p2, :cond_1

    .line 109
    .line 110
    iget-object p1, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 111
    .line 112
    invoke-static {p1, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget-object p2, p0, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->g:Landroid/content/Context;

    .line 117
    .line 118
    const/16 v0, 0x18

    .line 119
    .line 120
    invoke-static {p2, v0}, Lcom/zte/mifavor/widget/u;->b(Landroid/content/Context;I)I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    invoke-virtual {p0, p1, p2}, Landroid/widget/Switch;->setMeasuredDimension(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :catch_0
    move-exception p0

    .line 129
    sget-object p1, Lcom/zte/mifavor/widget/remote/RemoteSwitch;->h:Ljava/lang/String;

    .line 130
    .line 131
    new-instance p2, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v0, "Exception="

    .line 137
    .line 138
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    :cond_1
    return-void
.end method
