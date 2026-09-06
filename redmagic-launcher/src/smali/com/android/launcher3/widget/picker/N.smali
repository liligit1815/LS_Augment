.class public final synthetic Lcom/android/launcher3/widget/picker/N;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntPredicate;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/picker/T;

.field public final synthetic b:Lcom/android/launcher3/util/L1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/picker/T;Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/N;->a:Lcom/android/launcher3/widget/picker/T;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/N;->b:Lcom/android/launcher3/util/L1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/N;->a:Lcom/android/launcher3/widget/picker/T;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/N;->b:Lcom/android/launcher3/util/L1;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/widget/picker/T;->r(Lcom/android/launcher3/widget/picker/T;Lcom/android/launcher3/util/L1;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
