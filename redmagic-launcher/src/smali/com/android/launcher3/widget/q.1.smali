.class public final synthetic Lcom/android/launcher3/widget/q;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lm2/g;

.field public final synthetic b:Lz1/Z4;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lm2/g;Lz1/Z4;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/q;->a:Lm2/g;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/q;->b:Lz1/Z4;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/widget/q;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/q;->a:Lm2/g;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/q;->b:Lz1/Z4;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/widget/q;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    check-cast p1, Lz1/Z4;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/widget/ComponentDetailSheet;->X0(Lm2/g;Lz1/Z4;Ljava/util/ArrayList;Lz1/Z4;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
