.class final Lcom/android/launcher3/resource/ResourceDatabaseProvider$a;
.super Ljava/lang/Object;
.source "ResourceDatabaseProvider.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/ResourceDatabaseProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# static fields
.field static final a:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "content://com.zte.mifavor.launcher.resource/appsSortInfo"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$a;->a:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method
