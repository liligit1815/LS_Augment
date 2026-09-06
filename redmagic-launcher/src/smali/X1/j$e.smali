.class final LX1/j$e;
.super Ljava/lang/Object;
.source "TransientBubbleStashController.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LX1/j;->l0(ZJ)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:LX1/j;


# direct methods
.method constructor <init>(ZLX1/j;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LX1/j$e;->g:Z

    .line 2
    .line 3
    iput-object p2, p0, LX1/j$e;->h:LX1/j;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-boolean v0, p0, LX1/j$e;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    iget-object v0, p0, LX1/j$e;->h:LX1/j;

    .line 7
    .line 8
    invoke-static {v0}, LX1/j;->P(LX1/j;)Lcom/android/launcher3/util/v1$c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string v0, "bubbleBarAlpha"

    .line 15
    .line 16
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    move-object v0, v1

    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, LX1/j$e;->h:LX1/j;

    .line 25
    .line 26
    invoke-static {v0}, LX1/j;->R(LX1/j;)Lcom/android/launcher3/anim/d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const-string v0, "bubbleBarBubbleAlpha"

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    move-object v0, v1

    .line 38
    :cond_1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, LX1/j$e;->h:LX1/j;

    .line 44
    .line 45
    invoke-static {v0}, LX1/j;->Q(LX1/j;)Lcom/android/launcher3/anim/d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    const-string v0, "bubbleBarBackgroundAlpha"

    .line 52
    .line 53
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    move-object v0, v1

    .line 57
    :cond_2
    invoke-virtual {v0, v3}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, LX1/j$e;->h:LX1/j;

    .line 61
    .line 62
    invoke-static {v0}, LX1/j;->W(LX1/j;)Lcom/android/launcher3/anim/d;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, v2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, LX1/j$e;->h:LX1/j;

    .line 70
    .line 71
    invoke-static {v0}, LX1/j;->S(LX1/j;)Lcom/android/launcher3/anim/d;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    const-string v0, "bubbleBarBubbleTranslationY"

    .line 78
    .line 79
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    move-object v0, v1

    .line 83
    :cond_3
    invoke-virtual {v0, v2}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, LX1/j$e;->h:LX1/j;

    .line 87
    .line 88
    invoke-static {v0}, LX1/j;->T(LX1/j;)Lcom/android/launcher3/taskbar/bubbles/g0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-nez v0, :cond_4

    .line 93
    .line 94
    const-string v0, "bubbleBarViewController"

    .line 95
    .line 96
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    move-object v0, v1

    .line 100
    :cond_4
    const/4 v2, 0x0

    .line 101
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/bubbles/g0;->u1(Z)V

    .line 102
    .line 103
    .line 104
    :cond_5
    iget-object p0, p0, LX1/j$e;->h:LX1/j;

    .line 105
    .line 106
    invoke-static {p0}, LX1/j;->V(LX1/j;)Lcom/android/launcher3/taskbar/N2;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    if-nez p0, :cond_6

    .line 111
    .line 112
    const-string p0, "taskbarInsetsController"

    .line 113
    .line 114
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_6
    move-object v1, p0

    .line 119
    :goto_0
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/N2;->p()V

    .line 120
    .line 121
    .line 122
    return-void
.end method
