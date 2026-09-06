.class public final synthetic LL0/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/media/permission/SafeCloseable;


# instance fields
.field public final synthetic g:LL0/n;

.field public final synthetic h:LL0/n$c;


# direct methods
.method public synthetic constructor <init>(LL0/n;LL0/n$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LL0/f;->g:LL0/n;

    .line 5
    .line 6
    iput-object p2, p0, LL0/f;->h:LL0/n$c;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/f;->g:LL0/n;

    .line 2
    .line 3
    iget-object p0, p0, LL0/f;->h:LL0/n$c;

    .line 4
    .line 5
    invoke-static {v0, p0}, LL0/n;->b(LL0/n;LL0/n$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
