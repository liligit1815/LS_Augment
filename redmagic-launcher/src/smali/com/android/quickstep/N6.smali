.class public final synthetic Lcom/android/quickstep/N6;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/TouchInteractionService$TISBinder;

.field public final synthetic h:J

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/N6;->g:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/android/quickstep/N6;->h:J

    .line 7
    .line 8
    iput p4, p0, Lcom/android/quickstep/N6;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/N6;->g:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/android/quickstep/N6;->h:J

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/N6;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->U2(Lcom/android/quickstep/TouchInteractionService$TISBinder;JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
