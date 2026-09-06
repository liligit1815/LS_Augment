.class Lcom/android/launcher3/taskbar/g3$b;
.super Ljava/lang/Object;
.source "TaskbarManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/g3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/g3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/g3;->s(Lcom/android/launcher3/taskbar/g3;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 8
    .line 9
    const-string v2, "onActivityDestroyed:"

    .line 10
    .line 11
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->g(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/statemanager/h;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/launcher3/taskbar/g3;->g(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/statemanager/h;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/app/Activity;->getDisplayId()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->g(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/statemanager/h;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/android/launcher3/taskbar/g3;->h(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/X3$b;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 48
    .line 49
    const-string v2, "onActivityDestroyed: unregistering callbacks"

    .line 50
    .line 51
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 55
    .line 56
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->g(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/statemanager/h;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x3

    .line 61
    invoke-virtual {v1, v2, p0}, Lcom/android/launcher3/v;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->g(Lcom/android/launcher3/taskbar/g3;)Lcom/android/launcher3/statemanager/h;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 71
    .line 72
    invoke-static {v2}, Lcom/android/launcher3/taskbar/g3;->i(Lcom/android/launcher3/taskbar/g3;)Lcom/android/quickstep/views/RecentsViewContainer;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const/4 v3, 0x0

    .line 77
    if-ne v1, v2, :cond_1

    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/android/launcher3/taskbar/g3;->p(Lcom/android/launcher3/taskbar/g3;Lcom/android/quickstep/views/RecentsViewContainer;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 85
    .line 86
    invoke-static {v1, v3}, Lcom/android/launcher3/taskbar/g3;->o(Lcom/android/launcher3/taskbar/g3;Lcom/android/launcher3/statemanager/h;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 98
    .line 99
    const-string v4, "onActivityDestroyed: setting taskbarUIController"

    .line 100
    .line 101
    invoke-virtual {v2, v4, v0}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 102
    .line 103
    .line 104
    sget-object v0, Lcom/android/launcher3/taskbar/o4;->i:Lcom/android/launcher3/taskbar/o4;

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/I1;->n2(Lcom/android/launcher3/taskbar/o4;)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 111
    .line 112
    const-string v2, "onActivityDestroyed: taskbar is null!"

    .line 113
    .line 114
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/taskbar/g3;->Q(Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$b;->g:Lcom/android/launcher3/taskbar/g3;

    .line 118
    .line 119
    invoke-static {p0}, Lcom/android/launcher3/taskbar/g3;->n(Lcom/android/launcher3/taskbar/g3;)LF2/i;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0, v3}, LF2/i;->k(LC2/i;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method
