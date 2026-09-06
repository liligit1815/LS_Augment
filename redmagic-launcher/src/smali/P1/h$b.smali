.class LP1/h$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DepthController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LP1/h;->N(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/V3;

.field final synthetic i:LP1/h;


# direct methods
.method constructor <init>(LP1/h;ZLcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    iput-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 2
    .line 3
    iput-boolean p2, p0, LP1/h$b;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, LP1/h$b;->h:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, LP1/h$b;->g:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 16
    .line 17
    invoke-static {}, Lx1/O;->A2()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/BaseDepthController;->setBlur(Z)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p1, LP1/h;->m:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    iget-object v0, p0, LP1/h$b;->h:Lcom/android/launcher3/V3;

    .line 30
    .line 31
    invoke-static {p1}, LP1/h;->m(LP1/h;)Lcom/android/launcher3/C2;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/high16 v1, 0x3f800000    # 1.0f

    .line 44
    .line 45
    if-eq v0, p1, :cond_1

    .line 46
    .line 47
    sget-object p1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 48
    .line 49
    iget-object v0, p0, LP1/h$b;->i:LP1/h;

    .line 50
    .line 51
    invoke-static {v0}, LP1/h;->n(LP1/h;)Lcom/android/launcher3/C2;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-ne p1, v0, :cond_1

    .line 64
    .line 65
    iget-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(F)V

    .line 68
    .line 69
    .line 70
    :cond_1
    sget-object p1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 71
    .line 72
    iget-object v0, p0, LP1/h$b;->h:Lcom/android/launcher3/V3;

    .line 73
    .line 74
    if-ne p1, v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, LP1/h$b;->i:LP1/h;

    .line 77
    .line 78
    invoke-static {v0}, LP1/h;->o(LP1/h;)Lcom/android/launcher3/C2;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-ne p1, v0, :cond_2

    .line 91
    .line 92
    iget-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 93
    .line 94
    invoke-static {p1}, LP1/h;->p(LP1/h;)Lcom/android/launcher3/C2;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 103
    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    :cond_2
    sget-object p1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 107
    .line 108
    iget-object v0, p0, LP1/h$b;->h:Lcom/android/launcher3/V3;

    .line 109
    .line 110
    if-ne p1, v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, LP1/h$b;->i:LP1/h;

    .line 113
    .line 114
    invoke-static {v0}, LP1/h;->q(LP1/h;)Lcom/android/launcher3/C2;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    if-ne p1, v0, :cond_4

    .line 127
    .line 128
    :cond_3
    iget-object p1, p0, LP1/h$b;->i:LP1/h;

    .line 129
    .line 130
    invoke-static {p1}, LP1/h;->r(LP1/h;)F

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    const/4 v0, 0x0

    .line 135
    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_4

    .line 140
    .line 141
    const-string p1, "DepthController"

    .line 142
    .line 143
    const-string v0, "setStateWithAnimation end ALL_APPS or OVERVIEW"

    .line 144
    .line 145
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, LP1/h$b;->i:LP1/h;

    .line 149
    .line 150
    invoke-virtual {p0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(F)V

    .line 151
    .line 152
    .line 153
    :cond_4
    return-void
.end method
