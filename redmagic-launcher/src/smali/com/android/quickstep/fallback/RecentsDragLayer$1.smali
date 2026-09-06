.class Lcom/android/quickstep/fallback/RecentsDragLayer$1;
.super Ljava/lang/Object;
.source "RecentsDragLayer.java"

# interfaces
.implements Lcom/android/launcher3/uioverrides/touchcontrollers/I;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/fallback/RecentsDragLayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/fallback/RecentsDragLayer;


# direct methods
.method constructor <init>(Lcom/android/quickstep/fallback/RecentsDragLayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/RecentsDragLayer$1;->this$0:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public isRecentsInteractive()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/RecentsDragLayer$1;->this$0:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/fallback/RecentsDragLayer;->access$000(Lcom/android/quickstep/fallback/RecentsDragLayer;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->hasWindowFocus()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 20
    .line 21
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/fallback/RecentsDragLayer$1;->this$0:Lcom/android/quickstep/fallback/RecentsDragLayer;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/android/quickstep/fallback/RecentsDragLayer;->access$100(Lcom/android/quickstep/fallback/RecentsDragLayer;)Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/android/quickstep/fallback/RecentsState;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/RecentsState;->hasLiveTile()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public isRecentsModal()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic onUserControlledAnimationCreated(Lcom/android/launcher3/anim/q;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/I;->onUserControlledAnimationCreated(Lcom/android/launcher3/anim/q;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
