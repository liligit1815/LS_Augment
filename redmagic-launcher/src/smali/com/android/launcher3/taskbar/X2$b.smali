.class Lcom/android/launcher3/taskbar/X2$b;
.super Ljava/lang/Object;
.source "TaskbarLauncherStateController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/X2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/X2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/X2;->u(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 19
    .line 20
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/X2;->z(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/V3;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->m(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/V3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->n(Lcom/android/launcher3/taskbar/X2;)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    and-int/lit8 v1, v1, -0x5

    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/X2;->v(Lcom/android/launcher3/taskbar/X2;Ljava/lang/Integer;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 29
    .line 30
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/X2;->u(Lcom/android/launcher3/taskbar/X2;Lcom/android/launcher3/V3;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 34
    .line 35
    const/4 v1, 0x4

    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/X2;->n0(IZ)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->o(Lcom/android/launcher3/taskbar/X2;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 49
    .line 50
    if-ne p1, v0, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 53
    .line 54
    invoke-static {p1}, Lcom/android/launcher3/taskbar/X2;->j(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/taskbar/R1;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const/4 v2, 0x0

    .line 74
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 75
    .line 76
    invoke-static {v2}, Lcom/android/launcher3/q5;->y0(Z)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    int-to-long v0, p1

    .line 81
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/X2;->D(J)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$b;->g:Lcom/android/launcher3/taskbar/X2;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/X2;->C()V

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/X2$b;->a(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/X2$b;->b(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
