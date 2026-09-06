.class Lcom/android/launcher3/C2$o;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->Y3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

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
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "launcherIconAnimation: onResumeDelay getUnlockAnimState()="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/launcher3/C2;->P0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/W3;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const-string v1, " mMfvAnimationSets is null"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/android/launcher3/C2;->P0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/W3;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/android/launcher3/W3;->o()Lcom/android/launcher3/W3$e;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", mHasFocus="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 41
    .line 42
    iget-boolean v1, v1, Lcom/android/launcher3/C2;->B0:Z

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, ", isScreenLocked: "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->a3()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    const-string v1, "lock"

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string v1, "unLock"

    .line 64
    .line 65
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "Launcher"

    .line 73
    .line 74
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/android/launcher3/C2;->P0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/W3;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 86
    .line 87
    iget-boolean v1, v0, Lcom/android/launcher3/C2;->B0:Z

    .line 88
    .line 89
    if-nez v1, :cond_2

    .line 90
    .line 91
    invoke-static {v0}, Lcom/android/launcher3/C2;->P0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/W3;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lcom/android/launcher3/W3;->o()Lcom/android/launcher3/W3$e;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget-object v1, Lcom/android/launcher3/W3$e;->l:Lcom/android/launcher3/W3$e;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    iget-object v0, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->a3()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/android/launcher3/C2;->P0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/W3;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object p0, p0, Lcom/android/launcher3/C2$o;->g:Lcom/android/launcher3/C2;

    .line 122
    .line 123
    new-instance v1, Landroid/graphics/Point;

    .line 124
    .line 125
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 126
    .line 127
    .line 128
    const/4 v2, -0x1

    .line 129
    const-string v3, "onResumeDelay"

    .line 130
    .line 131
    invoke-virtual {v0, v3, p0, v1, v2}, Lcom/android/launcher3/W3;->D(Ljava/lang/String;Lcom/android/launcher3/C2;Landroid/graphics/Point;I)V

    .line 132
    .line 133
    .line 134
    :cond_2
    return-void
.end method
