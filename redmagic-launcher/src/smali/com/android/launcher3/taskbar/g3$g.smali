.class Lcom/android/launcher3/taskbar/g3$g;
.super Ljava/lang/Object;
.source "TaskbarManager.java"

# interfaces
.implements Lcom/android/launcher3/util/Z$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/g3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "g"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/g3;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/taskbar/h3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3$g;-><init>(Lcom/android/launcher3/taskbar/g3;)V

    return-void
.end method


# virtual methods
.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    and-int/lit8 v0, p3, 0x4

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 10
    .line 11
    const-string v1, "onDisplayInfoChanged: Display density changed"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    and-int/lit8 v0, p3, 0x10

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 21
    .line 22
    const-string v1, "onDisplayInfoChanged: Navigation mode changed"

    .line 23
    .line 24
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    and-int/lit8 v0, p3, 0x40

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 32
    .line 33
    const-string v2, "onDisplayInfoChanged: Desktop mode changed"

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getDisplayId()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {v1, v2, p1}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/android/launcher3/taskbar/g3;->v(Lcom/android/launcher3/taskbar/g3;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    and-int/lit8 p1, p3, 0x20

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 52
    .line 53
    const-string v1, "onDisplayInfoChanged: Taskbar pinning changed"

    .line 54
    .line 55
    invoke-virtual {p1, v1, p2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    and-int/lit16 p1, p3, 0xf4

    .line 59
    .line 60
    if-eqz p1, :cond_7

    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    and-int/lit16 p3, p3, 0x80

    .line 69
    .line 70
    if-eqz p3, :cond_4

    .line 71
    .line 72
    iget-object p1, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 73
    .line 74
    const-string p3, "onDisplayInfoChanged: show locked taskbar changed!"

    .line 75
    .line 76
    invoke-virtual {p1, p3, p2}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    if-eqz v0, :cond_6

    .line 86
    .line 87
    iget-object p2, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 88
    .line 89
    invoke-static {p2}, Lcom/android/launcher3/taskbar/g3;->k(Lcom/android/launcher3/taskbar/g3;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-eqz p2, :cond_5

    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 96
    .line 97
    const/4 p1, 0x0

    .line 98
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/g3;->q(Lcom/android/launcher3/taskbar/g3;Z)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    if-eqz p1, :cond_7

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->r2()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_7

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$g;->g:Lcom/android/launcher3/taskbar/g3;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 119
    .line 120
    .line 121
    :cond_7
    return-void
.end method
