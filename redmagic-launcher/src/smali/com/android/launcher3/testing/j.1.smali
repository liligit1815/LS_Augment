.class public final synthetic Lcom/android/launcher3/testing/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/testing/TestInformationHandler;

.field public final synthetic b:Lcom/android/launcher3/F1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/testing/TestInformationHandler;Lcom/android/launcher3/F1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/testing/j;->a:Lcom/android/launcher3/testing/TestInformationHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/testing/j;->b:Lcom/android/launcher3/F1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/testing/j;->a:Lcom/android/launcher3/testing/TestInformationHandler;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/testing/j;->b:Lcom/android/launcher3/F1;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->c(Lcom/android/launcher3/testing/TestInformationHandler;Lcom/android/launcher3/F1;Lcom/android/launcher3/C2;)Landroid/graphics/Point;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
