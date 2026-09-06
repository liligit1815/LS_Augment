.class public final synthetic Lcom/android/quickstep/util/t;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/AppPairsController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/AppPairsController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/t;->a:Lcom/android/quickstep/util/AppPairsController;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/t;->a:Lcom/android/quickstep/util/AppPairsController;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/E;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/util/AppPairsController;->h(Lcom/android/quickstep/util/AppPairsController;Lcom/android/launcher3/model/data/I;)Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
