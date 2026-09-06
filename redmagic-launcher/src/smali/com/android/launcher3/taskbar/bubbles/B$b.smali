.class final Lcom/android/launcher3/taskbar/bubbles/B$b;
.super Ljava/lang/Object;
.source "BubbleBarSwipeController.kt"

# interfaces
.implements Lcom/android/launcher3/taskbar/bubbles/B$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/bubbles/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final a:I

.field private final b:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 2

    .line 1
    const-string v0, "taskbarActivityContext"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/c4;->c(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/android/launcher3/taskbar/bubbles/B$b;->a:I

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/bubbles/B$b;->a()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    sub-int/2addr p1, v0

    .line 34
    iput p1, p0, Lcom/android/launcher3/taskbar/bubbles/B$b;->b:I

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/bubbles/B$b;->b:I

    .line 2
    .line 3
    return p0
.end method
