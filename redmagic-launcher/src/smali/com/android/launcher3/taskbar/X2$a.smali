.class Lcom/android/launcher3/taskbar/X2$a;
.super Ljava/lang/Object;
.source "TaskbarLauncherStateController.java"

# interfaces
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/X2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/X2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/X2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/X2$a;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$a;->g:Lcom/android/launcher3/taskbar/X2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->k(Lcom/android/launcher3/taskbar/X2;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-boolean v0, p1, Lcom/android/launcher3/h0;->M0:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$a;->g:Lcom/android/launcher3/taskbar/X2;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/taskbar/X2;->l(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/high16 v2, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/Hotseat;->p1(FI)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/X2$a;->g:Lcom/android/launcher3/taskbar/X2;

    .line 30
    .line 31
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->M0:Z

    .line 32
    .line 33
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/X2;->t(Lcom/android/launcher3/taskbar/X2;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/taskbar/X2$a;->g:Lcom/android/launcher3/taskbar/X2;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/taskbar/X2;->r(Lcom/android/launcher3/taskbar/X2;)Lcom/android/launcher3/util/v1$c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/taskbar/X2;->y(Lcom/android/launcher3/taskbar/X2;FI)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/taskbar/X2$a;->g:Lcom/android/launcher3/taskbar/X2;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/android/launcher3/taskbar/X2;->i(Lcom/android/launcher3/taskbar/X2;)LN2/h;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1, v1}, Lcom/android/launcher3/taskbar/X2;->X(LN2/h;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
