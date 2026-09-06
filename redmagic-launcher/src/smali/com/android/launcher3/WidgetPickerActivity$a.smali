.class Lcom/android/launcher3/WidgetPickerActivity$a;
.super Lv2/c;
.source "WidgetPickerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/WidgetPickerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field n:Landroid/window/OnBackAnimationCallback;

.field final synthetic o:Lcom/android/launcher3/WidgetPickerActivity;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/WidgetPickerActivity;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->o:Lcom/android/launcher3/WidgetPickerActivity;

    invoke-direct {p0}, Lv2/c;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/WidgetPickerActivity;Lcom/android/launcher3/b6;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity$a;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    return-void
.end method


# virtual methods
.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0}, Landroid/window/OnBackAnimationCallback;->onBackCancelled()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 11
    .line 12
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0}, Landroid/window/OnBackAnimationCallback;->onBackInvoked()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 11
    .line 12
    return-void
.end method

.method public g(Landroid/window/BackEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Landroid/window/OnBackAnimationCallback;->onBackProgressed(Landroid/window/BackEvent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Landroid/window/OnBackAnimationCallback;->onBackCancelled()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->o:Lcom/android/launcher3/WidgetPickerActivity;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/android/launcher3/WidgetPickerActivity;->k0(Lcom/android/launcher3/WidgetPickerActivity;)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->o:Lcom/android/launcher3/WidgetPickerActivity;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/android/launcher3/WidgetPickerActivity;->k0(Lcom/android/launcher3/WidgetPickerActivity;)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity$a;->n:Landroid/window/OnBackAnimationCallback;

    .line 23
    .line 24
    invoke-interface {v0, p1}, Landroid/window/OnBackAnimationCallback;->onBackStarted(Landroid/window/BackEvent;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
