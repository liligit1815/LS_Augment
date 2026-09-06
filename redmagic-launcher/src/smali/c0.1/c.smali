.class public final synthetic Lc0/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/profileinstaller/f$c;

.field public final synthetic h:I

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroidx/profileinstaller/f$c;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc0/c;->g:Landroidx/profileinstaller/f$c;

    .line 5
    .line 6
    iput p2, p0, Lc0/c;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Lc0/c;->i:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lc0/c;->g:Landroidx/profileinstaller/f$c;

    .line 2
    .line 3
    iget v1, p0, Lc0/c;->h:I

    .line 4
    .line 5
    iget-object p0, p0, Lc0/c;->i:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroidx/profileinstaller/f;->a(Landroidx/profileinstaller/f$c;ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
