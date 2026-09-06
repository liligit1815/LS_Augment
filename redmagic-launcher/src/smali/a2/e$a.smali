.class La2/e$a;
.super Ljava/lang/Object;
.source "TaskbarOverlayController.java"

# interfaces
.implements Lcom/android/systemui/shared/system/TaskStackChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = La2/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:La2/e;


# direct methods
.method constructor <init>(La2/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, La2/e$a;->g:La2/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private a()V
    .locals 2

    .line 1
    iget-object v0, p0, La2/e$a;->g:La2/e;

    .line 2
    .line 3
    invoke-static {v0}, La2/e;->d(La2/e;)Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, La2/e$a;->g:La2/e;

    .line 14
    .line 15
    invoke-virtual {p0}, La2/e;->m()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onTaskMovedToFront(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, La2/e$a;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTaskStackChanged()V
    .locals 1

    .line 1
    iget-object v0, p0, La2/e$a;->g:La2/e;

    .line 2
    .line 3
    invoke-static {v0}, La2/e;->d(La2/e;)Lcom/android/launcher3/taskbar/R1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, La2/e$a;->g:La2/e;

    .line 14
    .line 15
    invoke-static {v0}, La2/e;->d(La2/e;)Lcom/android/launcher3/taskbar/R1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/R1;->g()Lcom/android/launcher3/taskbar/J3;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-boolean v0, v0, Lcom/android/launcher3/taskbar/J3;->n:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-direct {p0}, La2/e$a;->a()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
