.class public final synthetic Lcom/android/quickstep/E6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/android/quickstep/E6;->a:J

    .line 5
    .line 6
    iput p3, p0, Lcom/android/quickstep/E6;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/E6;->a:J

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/E6;->b:I

    .line 4
    .line 5
    check-cast p1, Lcom/android/quickstep/TouchInteractionService;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->b3(JILcom/android/quickstep/TouchInteractionService;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
