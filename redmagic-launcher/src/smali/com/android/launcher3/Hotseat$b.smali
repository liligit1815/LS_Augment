.class Lcom/android/launcher3/Hotseat$b;
.super Lcom/android/launcher3/anim/g;
.source "Hotseat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Hotseat;->t1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/Hotseat;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Hotseat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/android/launcher3/Hotseat;->P0(Lcom/android/launcher3/Hotseat;Landroid/animation/AnimatorSet;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Hotseat;->l1(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/Hotseat;->O0(Lcom/android/launcher3/Hotseat;)Landroid/widget/ImageView;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/Hotseat;->O0(Lcom/android/launcher3/Hotseat;)Landroid/widget/ImageView;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/android/launcher3/Hotseat;->O0(Lcom/android/launcher3/Hotseat;)Landroid/widget/ImageView;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_0

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/Hotseat$b;->g:Lcom/android/launcher3/Hotseat;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "voice"

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/android/launcher3/W3;->t(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_0
    return-void
.end method
