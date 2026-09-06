.class Lcom/android/launcher3/taskbar/M0$d;
.super Ljava/lang/Object;
.source "NavbarButtonsViewController.java"

# interfaces
.implements Lcom/android/systemui/shared/rotation/RotationButton$RotationButtonUpdatesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/M0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/M0;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/M0$d;->a:Lcom/android/launcher3/taskbar/M0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/taskbar/M0;Lcom/android/launcher3/taskbar/N0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/M0$d;-><init>(Lcom/android/launcher3/taskbar/M0;)V

    return-void
.end method


# virtual methods
.method public onVisibilityChanged(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/taskbar/M0$d;->a:Lcom/android/launcher3/taskbar/M0;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/android/launcher3/taskbar/M0;->M(Lcom/android/launcher3/taskbar/M0;)Lcom/android/systemui/shared/rotation/FloatingRotationButton;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/android/systemui/shared/rotation/FloatingRotationButton;->getCurrentView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$d;->a:Lcom/android/launcher3/taskbar/M0;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/android/launcher3/taskbar/M0;->N(Lcom/android/launcher3/taskbar/M0;)Landroid/graphics/Rect;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/M0$d;->a:Lcom/android/launcher3/taskbar/M0;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/taskbar/M0;->N(Lcom/android/launcher3/taskbar/M0;)Landroid/graphics/Rect;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Landroid/graphics/Rect;->setEmpty()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
