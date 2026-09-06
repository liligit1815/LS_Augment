.class Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ShareSystemShortcut;
.super Lcom/android/launcher3/popup/P;
.source "TaskOverlayFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShareSystemShortcut"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;


# direct methods
.method constructor <init>(Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ShareSystemShortcut;->this$0:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    const v1, 0x7f08127c

    .line 4
    .line 5
    .line 6
    const v2, 0x7f140044

    .line 7
    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p2

    .line 11
    move-object v4, p3

    .line 12
    move-object v5, p4

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay$ShareSystemShortcut;->this$0:Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/android/quickstep/TaskOverlayFactory$TaskOverlay;->mImageApi:Lcom/android/quickstep/ImageActionsApi;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Lcom/android/quickstep/ImageActionsApi;->startShareActivity(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
