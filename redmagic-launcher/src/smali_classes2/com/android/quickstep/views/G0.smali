.class public final synthetic Lcom/android/quickstep/views/G0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:I

.field public final synthetic c:[Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;I[Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/G0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/views/G0;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/G0;->c:[Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/G0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/G0;->b:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/G0;->c:[Z

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/views/RecentsView;->c1(Lcom/android/quickstep/views/RecentsView;I[ZLjava/lang/Float;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
