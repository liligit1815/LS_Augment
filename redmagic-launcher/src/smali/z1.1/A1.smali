.class public final Lz1/A1;
.super Ljava/lang/Object;
.source "LoaderCursor_LoaderCursorFactory_Impl.java"

# interfaces
.implements Lz1/y1$a;


# instance fields
.field private final a:Lz1/z1;


# direct methods
.method constructor <init>(Lz1/z1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/A1;->a:Lz1/z1;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Lz1/z1;)Lf4/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/z1;",
            ")",
            "Lf4/f<",
            "Lz1/y1$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/A1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lz1/A1;-><init>(Lz1/z1;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public a(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)Lz1/y1;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/A1;->a:Lz1/z1;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lz1/z1;->b(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)Lz1/y1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
