.class Lcom/android/launcher3/taskbar/g3$a;
.super Ljava/lang/Object;
.source "TaskbarManager.java"

# interfaces
.implements LP1/k$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/g3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/g3;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/g3$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3$a;->d(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/g3$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/g3$a;->c(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/g3;->s(Lcom/android/launcher3/taskbar/g3;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->y(Lcom/android/launcher3/taskbar/g3;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic d(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/g3;->s(Lcom/android/launcher3/taskbar/g3;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/taskbar/g3;->y(Lcom/android/launcher3/taskbar/g3;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public h(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public i(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->m(Lcom/android/launcher3/taskbar/g3;)Landroid/util/SparseArray;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_2

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->m(Lcom/android/launcher3/taskbar/g3;)Landroid/util/SparseArray;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sget-object v2, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 33
    .line 34
    invoke-static {v2, v1}, Lcom/android/launcher3/taskbar/g3;->w(Lcom/android/launcher3/taskbar/g3;I)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 42
    .line 43
    invoke-virtual {v2, v1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->W0()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    invoke-static {v2, v3}, Lcom/android/launcher3/taskbar/g3;->q(Lcom/android/launcher3/taskbar/g3;Z)V

    .line 59
    .line 60
    .line 61
    const/16 v2, 0x64

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/I1;->R1(I)Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Lcom/android/launcher3/taskbar/e3;

    .line 68
    .line 69
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/taskbar/e3;-><init>(Lcom/android/launcher3/taskbar/g3$a;I)V

    .line 70
    .line 71
    .line 72
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 80
    .line 81
    .line 82
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    return-void
.end method

.method public j(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->m(Lcom/android/launcher3/taskbar/g3;)Landroid/util/SparseArray;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_2

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/android/launcher3/taskbar/g3;->m(Lcom/android/launcher3/taskbar/g3;)Landroid/util/SparseArray;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sget-object v2, Landroid/window/DesktopExperienceFlags;->ENABLE_TASKBAR_CONNECTED_DISPLAYS:Landroid/window/DesktopExperienceFlags;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/window/DesktopExperienceFlags;->isTrue()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 33
    .line 34
    invoke-static {v2, v1}, Lcom/android/launcher3/taskbar/g3;->w(Lcom/android/launcher3/taskbar/g3;I)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 42
    .line 43
    invoke-virtual {v2, v1}, Lcom/android/launcher3/taskbar/g3;->h0(I)Lcom/android/launcher3/taskbar/I1;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Lcom/android/launcher3/taskbar/g3$a;->a:Lcom/android/launcher3/taskbar/g3;

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    invoke-static {v2, v3}, Lcom/android/launcher3/taskbar/g3;->q(Lcom/android/launcher3/taskbar/g3;Z)V

    .line 53
    .line 54
    .line 55
    const/16 v2, 0x64

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lcom/android/launcher3/taskbar/I1;->R1(I)Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Lcom/android/launcher3/taskbar/f3;

    .line 62
    .line 63
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/taskbar/f3;-><init>(Lcom/android/launcher3/taskbar/g3$a;I)V

    .line 64
    .line 65
    .line 66
    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return-void
.end method
