.class public final synthetic Lcom/android/launcher3/popup/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/util/L1;

.field public final synthetic b:Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/L1;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/k;->a:Lcom/android/launcher3/util/L1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/popup/k;->b:Ljava/util/function/Predicate;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/k;->a:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/popup/k;->b:Ljava/util/function/Predicate;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/popup/n;->e(Lcom/android/launcher3/util/L1;Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
