.class public final synthetic Lcom/android/quickstep/d2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/testing/TestInformationHandler$c;

.field public final synthetic b:Landroid/os/Bundle;

.field public final synthetic c:Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/testing/TestInformationHandler$c;Landroid/os/Bundle;Ljava/util/function/Function;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/d2;->a:Lcom/android/launcher3/testing/TestInformationHandler$c;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/d2;->b:Landroid/os/Bundle;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/d2;->c:Ljava/util/function/Function;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/d2;->a:Lcom/android/launcher3/testing/TestInformationHandler$c;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/d2;->b:Landroid/os/Bundle;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/d2;->c:Ljava/util/function/Function;

    .line 6
    .line 7
    check-cast p1, Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->S(Lcom/android/launcher3/testing/TestInformationHandler$c;Landroid/os/Bundle;Ljava/util/function/Function;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
