.class Lcom/android/launcher3/DropTargetBar$a;
.super Ljava/lang/Object;
.source "DropTargetBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/DropTargetBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/DropTargetBar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/DropTargetBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/anim/a;->a(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

    .line 7
    .line 8
    iget-boolean v1, v0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/DropTargetBar;->a(Lcom/android/launcher3/DropTargetBar;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/DropTargetBar;->a(Lcom/android/launcher3/DropTargetBar;)Lcom/android/launcher3/C2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/android/launcher3/DropTargetBar;->a(Lcom/android/launcher3/DropTargetBar;)Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lx1/O;->l(Lcom/android/launcher3/C2;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

    .line 42
    .line 43
    iget-boolean v1, v0, Lcom/android/launcher3/DropTargetBar;->i:Z

    .line 44
    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    invoke-static {v0}, Lcom/android/launcher3/DropTargetBar;->a(Lcom/android/launcher3/DropTargetBar;)Lcom/android/launcher3/C2;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/DropTargetBar$a;->g:Lcom/android/launcher3/DropTargetBar;

    .line 64
    .line 65
    invoke-static {p0}, Lcom/android/launcher3/DropTargetBar;->a(Lcom/android/launcher3/DropTargetBar;)Lcom/android/launcher3/C2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const/4 v0, 0x1

    .line 74
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/c;->B(Z)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method
