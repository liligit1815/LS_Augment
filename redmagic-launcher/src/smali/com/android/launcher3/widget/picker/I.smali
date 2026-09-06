.class public final synthetic Lcom/android/launcher3/widget/picker/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/picker/T;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/picker/T;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/I;->a:Lcom/android/launcher3/widget/picker/T;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/I;->a:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    check-cast p1, Lm2/g;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/picker/T;->k(Lcom/android/launcher3/widget/picker/T;Lm2/g;)Lm2/g;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
