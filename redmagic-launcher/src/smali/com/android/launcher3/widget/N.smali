.class public final synthetic Lcom/android/launcher3/widget/N;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/P;

.field public final synthetic b:Lz1/Z4;

.field public final synthetic c:Landroid/util/Size;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/P;Lz1/Z4;Landroid/util/Size;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/N;->a:Lcom/android/launcher3/widget/P;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/N;->b:Lz1/Z4;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/widget/N;->c:Landroid/util/Size;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/N;->a:Lcom/android/launcher3/widget/P;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/N;->b:Lz1/Z4;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/widget/N;->c:Landroid/util/Size;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/widget/P;->c(Lcom/android/launcher3/widget/P;Lz1/Z4;Landroid/util/Size;)Lcom/android/launcher3/widget/P$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
