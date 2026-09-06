.class public final synthetic Lcom/android/quickstep/m4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(ILjava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/m4;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/m4;->b:Ljava/util/function/Consumer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/m4;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/m4;->b:Ljava/util/function/Consumer;

    .line 4
    .line 5
    check-cast p1, Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/RecentsModel;->h(ILjava/util/function/Consumer;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
