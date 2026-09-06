.class Lcom/android/launcher3/taskbar/j2$a;
.super Ljava/lang/Object;
.source "TaskbarDragController.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/p$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/j2;->F0(Lcom/android/launcher3/BubbleTextView;Ln1/d;)Lcom/android/launcher3/dragndrop/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/dragndrop/v;

.field final synthetic h:Lcom/android/launcher3/taskbar/j2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/j2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$a;->h:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(D)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/v;->w()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public b(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/j2$a;->a(D)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$a;->h:Lcom/android/launcher3/taskbar/j2;

    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/taskbar/i2;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/i2;-><init>(Lcom/android/launcher3/taskbar/j2;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/android/launcher3/dragndrop/v;->setOnScaleAnimEndCallback(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public c(Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$a;->g:Lcom/android/launcher3/dragndrop/v;

    .line 3
    .line 4
    return-void
.end method
