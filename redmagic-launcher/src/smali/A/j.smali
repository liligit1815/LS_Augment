.class public final synthetic LA/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LA/h$f;

.field public final synthetic h:I


# direct methods
.method public synthetic constructor <init>(LA/h$f;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LA/j;->g:LA/h$f;

    .line 5
    .line 6
    iput p2, p0, LA/j;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LA/j;->g:LA/h$f;

    .line 2
    .line 3
    iget p0, p0, LA/j;->h:I

    .line 4
    .line 5
    invoke-static {v0, p0}, LA/h$f;->b(LA/h$f;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
