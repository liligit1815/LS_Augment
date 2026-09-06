.class public final synthetic Lz1/d5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lz1/e5;

.field public final synthetic b:Lcom/android/launcher3/widget/picker/e;


# direct methods
.method public synthetic constructor <init>(Lz1/e5;Lcom/android/launcher3/widget/picker/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/d5;->a:Lz1/e5;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/d5;->b:Lcom/android/launcher3/widget/picker/e;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/d5;->a:Lz1/e5;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/d5;->b:Lcom/android/launcher3/widget/picker/e;

    .line 4
    .line 5
    check-cast p1, Lz1/Z4;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lz1/e5;->c(Lz1/e5;Lcom/android/launcher3/widget/picker/e;Lz1/Z4;)Lcom/android/launcher3/widget/z0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
