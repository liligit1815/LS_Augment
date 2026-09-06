.class public final Lcom/android/launcher3/taskbar/b4$a;
.super Ljava/lang/Object;
.source "TaskbarStashViaTouchController.kt"

# interfaces
.implements Lcom/android/launcher3/touch/H$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/b4;->g()Lcom/android/launcher3/taskbar/b4$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private g:F

.field final synthetic h:Lcom/android/launcher3/taskbar/b4;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/b4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDrag(F)Z
    .locals 9

    .line 1
    iput p1, p0, Lcom/android/launcher3/taskbar/b4$a;->g:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpg-float v0, p1, v0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/taskbar/b4;->f(Lcom/android/launcher3/taskbar/b4;)Lcom/android/launcher3/taskbar/j4$b;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/android/launcher3/taskbar/b4;->b(Lcom/android/launcher3/taskbar/b4;)F

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    iget-object v2, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/android/launcher3/taskbar/b4;->c(Lcom/android/launcher3/taskbar/b4;)F

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/android/launcher3/taskbar/b4;->a(Lcom/android/launcher3/taskbar/b4;)Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    const/4 v4, 0x0

    .line 35
    const/4 v6, 0x0

    .line 36
    move v3, p1

    .line 37
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/j4$b;->c(F)V

    .line 42
    .line 43
    .line 44
    return v1
.end method

.method public onDragEnd(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/b4;->d(Lcom/android/launcher3/taskbar/b4;)Lcom/android/launcher3/touch/H;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    cmpl-float p1, p1, v0

    .line 17
    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    move p1, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move p1, v1

    .line 23
    :goto_0
    iget v0, p0, Lcom/android/launcher3/taskbar/b4$a;->g:F

    .line 24
    .line 25
    iget-object v3, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 26
    .line 27
    invoke-static {v3}, Lcom/android/launcher3/taskbar/b4;->e(Lcom/android/launcher3/taskbar/b4;)F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    cmpl-float v0, v0, v3

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    move v1, v2

    .line 36
    :cond_1
    if-nez p1, :cond_2

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/b4;->h()Lcom/android/launcher3/taskbar/R1;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/android/launcher3/taskbar/b4;->f(Lcom/android/launcher3/taskbar/b4;)Lcom/android/launcher3/taskbar/j4$b;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/j4$b;->b()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/launcher3/taskbar/b4$a;->h:Lcom/android/launcher3/taskbar/b4;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/android/launcher3/taskbar/b4;->d(Lcom/android/launcher3/taskbar/b4;)Lcom/android/launcher3/touch/H;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->c()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 0

    .line 1
    return-void
.end method
