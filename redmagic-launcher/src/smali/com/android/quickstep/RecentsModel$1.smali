.class Lcom/android/quickstep/RecentsModel$1;
.super Ljava/lang/Object;
.source "RecentsModel.java"

# interfaces
.implements Landroid/content/ComponentCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/RecentsModel;-><init>(Landroid/content/Context;Lcom/android/quickstep/RecentTasksList;Lcom/android/quickstep/TaskIconCache;Lcom/android/quickstep/TaskThumbnailCache;Ls1/T;Lcom/android/systemui/shared/system/TaskStackChangeListeners;Lcom/android/launcher3/util/n1;Le4/a;Lcom/android/launcher3/util/K;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/RecentsModel;


# direct methods
.method constructor <init>(Lcom/android/quickstep/RecentsModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentsModel$1;->this$0:Lcom/android/quickstep/RecentsModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsModel$1;->this$0:Lcom/android/quickstep/RecentsModel;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->updateCacheSizeAndPreloadIfNeeded()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    return-void
.end method
