.class public final LJ/A;
.super Ljava/lang/Object;
.source "PointerIconCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ/A$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/view/PointerIcon;


# direct methods
.method private constructor <init>(Landroid/view/PointerIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ/A;->a:Landroid/view/PointerIcon;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Landroid/content/Context;I)LJ/A;
    .locals 1

    .line 1
    new-instance v0, LJ/A;

    .line 2
    .line 3
    invoke-static {p0, p1}, LJ/A$a;->a(Landroid/content/Context;I)Landroid/view/PointerIcon;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, LJ/A;-><init>(Landroid/view/PointerIcon;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/A;->a:Landroid/view/PointerIcon;

    .line 2
    .line 3
    return-object p0
.end method
