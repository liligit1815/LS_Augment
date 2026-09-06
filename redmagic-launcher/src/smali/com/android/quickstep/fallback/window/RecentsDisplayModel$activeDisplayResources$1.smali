.class public final Lcom/android/quickstep/fallback/window/RecentsDisplayModel$activeDisplayResources$1;
.super Ljava/lang/Object;
.source "RecentsDisplayModel.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lv4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getActiveDisplayResources()Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;",
        ">;",
        "Lv4/a;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;


# direct methods
.method constructor <init>(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$activeDisplayResources$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$activeDisplayResources$1;->this$0:Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->access$getDisplayResourceArray(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)Landroid/util/SparseArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, LI/i;->a(Landroid/util/SparseArray;)Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
