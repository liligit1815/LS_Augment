.class public final synthetic Lcom/android/launcher3/uioverrides/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field public final synthetic b:Lcom/android/launcher3/util/y2$c;

.field public final synthetic c:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/j;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/j;->b:Lcom/android/launcher3/util/y2$c;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/uioverrides/j;->c:Lcom/android/quickstep/views/RecentsView;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/j;->a:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/j;->b:Lcom/android/launcher3/util/y2$c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/j;->c:Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    check-cast p1, [Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->d5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
