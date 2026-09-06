.class public final synthetic Lcom/android/launcher3/testing/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljava/util/function/Supplier;

.field public final synthetic b:Ljava/util/function/Function;

.field public final synthetic c:Lcom/android/launcher3/testing/TestInformationHandler$c;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Supplier;Ljava/util/function/Function;Lcom/android/launcher3/testing/TestInformationHandler$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/testing/l;->a:Ljava/util/function/Supplier;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/testing/l;->b:Ljava/util/function/Function;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/testing/l;->c:Lcom/android/launcher3/testing/TestInformationHandler$c;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/testing/l;->a:Ljava/util/function/Supplier;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/testing/l;->b:Ljava/util/function/Function;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/testing/l;->c:Lcom/android/launcher3/testing/TestInformationHandler$c;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/testing/TestInformationHandler;->a(Ljava/util/function/Supplier;Ljava/util/function/Function;Lcom/android/launcher3/testing/TestInformationHandler$c;)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
